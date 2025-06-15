//  ChatMessageRow.swift
//  PeerToPeerChat
//
//  Created by Assistant on 16.06.2025.
//

import SwiftUI

struct ChatMessageViewModel {
    let text: String
    let isMyMessage: Bool
    let senderName: String
}

struct ChatMessage: View {
    let viewModel: ChatMessageViewModel

    var body: some View {
        HStack {
            if viewModel.isMyMessage {
                Spacer(minLength: 40)
            }
            VStack(alignment: viewModel.isMyMessage ? .trailing : .leading, spacing: 2) {
                Text(viewModel.senderName)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: viewModel.isMyMessage ? .trailing : .leading)
                Text(viewModel.text)
                    .padding(12)
                    .background(viewModel.isMyMessage ? Color.blue : Color.gray.opacity(0.2))
                    .foregroundStyle(viewModel.isMyMessage ? .white : .primary)
                    .cornerRadius(16)
                    .frame(maxWidth: 260, alignment: viewModel.isMyMessage ? .trailing : .leading)
            }
            if !viewModel.isMyMessage {
                Spacer(minLength: 40)
            }
        }
        .padding(viewModel.isMyMessage ? .leading : .trailing, 40)
        .padding(.vertical, 2)
        .frame(maxWidth: .infinity, alignment: viewModel.isMyMessage ? .trailing : .leading)
    }
}

#Preview {
    VStack(spacing: 8) {
        ChatMessage(
            viewModel: .init(
                text: "Это сообщение собеседника",
                isMyMessage: false,
                senderName: "Аня"
            )
        )
        ChatMessage(
            viewModel: .init(
                text: "Это моё сообщение!",
                isMyMessage: true,
                senderName: "Я"
            )
        )
    }
    .padding()
}
