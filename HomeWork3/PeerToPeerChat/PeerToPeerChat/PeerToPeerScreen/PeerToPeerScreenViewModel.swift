//
//  PeerToPeerScreenViewModel.swift
//  PeerToPeerChat
//
//  Created by Nikolay on 16.06.2025.
//

import Foundation
import Combine

@MainActor
final class PeerToPeerScreenViewModel: ObservableObject {
    private let peerToPeerService: PeerToPeerService
    
    @Published var messages: [ChatMessageViewModel] = []
    @Published var attentionMessage: String?
    
    init(
        peerToPeerService: PeerToPeerService
    ) {
        self.peerToPeerService = peerToPeerService
        self.peerToPeerService.delegate = self
    }
    
    func sendMessage(_ text: String) {
        let myMessage = ChatMessageViewModel(text: text, isMyMessage: true, senderName: "Я")
        messages.append(myMessage)
        peerToPeerService.send(message: text)
    }
    
    func startBrowsing() {
        peerToPeerService.startBrowsing()
    }
    func startAdvertising() {
        peerToPeerService.startAdvertising()
    }
}

extension PeerToPeerScreenViewModel: @MainActor PeerToPeerServiceDelegate {
    func peerToPeerService(_ service: any PeerToPeerService, didReceiveMessage message: String, from device: PeerDevice) {
        let received = ChatMessageViewModel(text: message, isMyMessage: false, senderName: device.name)
        self.messages.append(received)
    }
    
    // MARK: - PeerToPeerServiceDelegate stubs
    
    func peerToPeerService(_ service: any PeerToPeerService, didChangeState state: PeerConnectionState) {
        showAttensionMessage(message: "Состояние изменилось на \(state)")
    }
    
    func peerToPeerService(_ service: any PeerToPeerService, didUpdateAvailableDevices devices: [PeerDevice]) {
        guard let device = devices.first else { return }
        showAttensionMessage(message: "Соединение с \(device.name)")
        service.connect(to: device)
    }
}

private extension PeerToPeerScreenViewModel {
    @MainActor
    func showAttensionMessage(message: String) {
        attentionMessage = message
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.attentionMessage = nil
        }
    }
}
