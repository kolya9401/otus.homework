//
//  SubscribeView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

struct SubscribeView: View {
    @State private var showedLogin = false
    
    var body: some View {
        Button("Subscribe") {
            showedLogin = true
        }
        .sheet(isPresented: $showedLogin) {
            RegistrationView()
        }
    }
}

