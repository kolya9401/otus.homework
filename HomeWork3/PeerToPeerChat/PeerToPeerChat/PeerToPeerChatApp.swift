//
//  PeerToPeerChatApp.swift
//  PeerToPeerChat
//
//  Created by Nikolay on 12.06.2025.
//

import SwiftUI

@main
struct PeerToPeerChatApp: App {
    var body: some Scene {
        WindowGroup {
            PeerToPeerScreenView(
                viewModel: PeerToPeerScreenViewModel(
                    peerToPeerService: PeerToPeerServiceImpl()
                )
            )
        }
    }
}
