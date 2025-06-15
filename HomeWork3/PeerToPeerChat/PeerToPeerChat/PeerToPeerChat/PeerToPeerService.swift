//
//  PeerToPeerService.swift
//  PeerToPeerChat
//
//  Created by Nikolay on 12.06.2025.
//

import MultipeerConnectivity

@MainActor
protocol PeerToPeerService: AnyObject {
    var delegate: PeerToPeerServiceDelegate? { get set }
    
    func stop()
    func startBrowsing()
    func startAdvertising()
    func availableDevices() -> [PeerDevice]
    func connect(to device: PeerDevice)
    func send(message: String)
}

@MainActor
protocol PeerToPeerServiceDelegate: AnyObject {
    func peerToPeerService(_ service: PeerToPeerService, didUpdateAvailableDevices devices: [PeerDevice])
    func peerToPeerService(_ service: PeerToPeerService, didChangeState state: PeerConnectionState)
    func peerToPeerService(_ service: PeerToPeerService, didReceiveMessage message: String, from device: PeerDevice)
}

@MainActor
final class PeerToPeerServiceImpl: NSObject {
    weak var delegate: PeerToPeerServiceDelegate?

    private let serviceType = "mp-service"
    private let myPeerID = MCPeerID(displayName: UIDevice.current.name)

    private lazy var session: MCSession = {
        let s = MCSession(peer: myPeerID, securityIdentity: nil, encryptionPreference: .required)
        s.delegate = self
        return s
    }()

    private lazy var advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: nil, serviceType: serviceType)
    private lazy var browser = MCNearbyServiceBrowser(peer: myPeerID, serviceType: serviceType)

    // Отображение MCPeerID → PeerDevice
    private var knownPeers: [MCPeerID: PeerDevice] = [:]
    private var currentState: PeerConnectionState = .notConnected {
        didSet {
            delegate?.peerToPeerService(self, didChangeState: currentState)
        }
    }

    override init() {
        super.init()
        advertiser.delegate = self
        browser.delegate = self
    }
}

// MARK: - PeerToPeerService
extension PeerToPeerServiceImpl: PeerToPeerService {
    func stop() {
        advertiser.stopAdvertisingPeer()
        browser.stopBrowsingForPeers()
        knownPeers.removeAll()
    }
    
    func startBrowsing() {
        browser.startBrowsingForPeers()
    }
    
    func startAdvertising() {
        advertiser.startAdvertisingPeer()
    }

    func availableDevices() -> [PeerDevice] {
        return Array(knownPeers.values)
    }

    func connect(to device: PeerDevice) {
        guard let peerID = knownPeers.first(where: { $0.value == device })?.key else { return }
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 10)
    }

    func send(message: String) {
        guard case let .connected(device) = currentState,
              let peerID = knownPeers.first(where: { $0.value == device })?.key,
              session.connectedPeers.contains(peerID),
              let data = message.data(using: .utf8)
        else { return }

        try? session.send(data, toPeers: [peerID], with: .reliable)
    }
}

extension PeerToPeerServiceImpl: @MainActor MCNearbyServiceBrowserDelegate {
    @MainActor
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo: [String : String]?) {
        guard peerID != myPeerID else { return }
        let device = PeerDevice(id: UUID(), name: peerID.displayName)
        knownPeers[peerID] = device
        delegate?.peerToPeerService(self, didUpdateAvailableDevices: availableDevices())
    }
    
    @MainActor
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        knownPeers.removeValue(forKey: peerID)
        delegate?.peerToPeerService(self, didUpdateAvailableDevices: availableDevices())
    }
}

extension PeerToPeerServiceImpl: @MainActor MCNearbyServiceAdvertiserDelegate {
    func advertiser(
        _ advertiser: MCNearbyServiceAdvertiser,
        didReceiveInvitationFromPeer peerID: MCPeerID,
        withContext context: Data?,
        invitationHandler: @escaping (Bool, MCSession?) -> Void
    ) {
        knownPeers[peerID] = PeerDevice(id: UUID(), name: peerID.displayName)
        invitationHandler(true, session)
    }
}

extension PeerToPeerServiceImpl: @MainActor MCSessionDelegate {
    func session(
        _ session: MCSession,
        peer peerID: MCPeerID,
        didChange state: MCSessionState
    ) {
        switch state {
        case .connected:
            if let device = knownPeers[peerID] {
                currentState = .connected(device: device)
            }
        case .notConnected:
            currentState = .notConnected
        case .connecting:
            currentState = .connecting
        @unknown default:
            break
        }
    }

    func session(
        _ session: MCSession,
        didReceive data: Data,
        fromPeer peerID: MCPeerID
    ) {
        guard
            let message = String(data: data, encoding: .utf8),
            let device = knownPeers[peerID]
        else {
            return
        }

        delegate?.peerToPeerService(self, didReceiveMessage: message, from: device)
    }
    
    func session(
        _ session: MCSession,
        didReceive stream: InputStream,
        withName streamName: String,
        fromPeer peerID: MCPeerID
    ) {
    }
    
    func session(
        _ session: MCSession,
        didStartReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        with progress: Progress
    ) {
    }
    
    func session(
        _ session: MCSession,
        didFinishReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        at localURL: URL?,
        withError error: (any Error)?
    ) {
    }
}

