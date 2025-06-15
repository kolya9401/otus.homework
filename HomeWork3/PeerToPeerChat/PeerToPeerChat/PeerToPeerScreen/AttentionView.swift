// AttentionView.swift
// PeerToPeerChat

import SwiftUI

struct AttentionView: View {
    let message: String
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 24)
            .background(Color.red.opacity(0.92))
            .cornerRadius(16)
            .shadow(radius: 6)
            .transition(.move(edge: .top).combined(with: .opacity))
            .padding(.top, 40)
    }
}

#Preview {
    AttentionView(message: "Внимание! Пример баннера.")
}
