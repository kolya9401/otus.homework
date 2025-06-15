//
//  PeerConnectionState.swift
//  PeerToPeerChat
//
//  Created by Nikolay on 12.06.2025.
//

enum PeerConnectionState {
    case notConnected
    case connecting
    case connected(device: PeerDevice)
}
