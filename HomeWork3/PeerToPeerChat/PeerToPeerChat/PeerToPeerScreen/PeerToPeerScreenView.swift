//
//  PeerToPeerScreenView.swift
//  PeerToPeerChat
//
//  Created by Nikolay on 16.06.2025.
//

import SwiftUI

struct PeerToPeerScreenView: View {
    @ObservedObject
    private var viewModel: PeerToPeerScreenViewModel
    
    @State private var inputText: String = ""
    
    init(viewModel: PeerToPeerScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    if let attentionMessage = viewModel.attentionMessage {
                        AttentionView(message: attentionMessage)
                    }
                    
                    LazyVStack(spacing: 8) {
                        ForEach(Array(viewModel.messages.enumerated()), id: \.offset) { index, message in
                            ChatMessage(viewModel: message)
                        }
                    }
                    .padding()
                }
                Divider()
                HStack(spacing: 8) {
                    TextField("Введите сообщение", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical, 8)
                    Button {
                        let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmed.isEmpty else { return }
                        viewModel.sendMessage(trimmed)
                        inputText = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? .gray : .blue)
                    }
                    .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
                .background(Color(.systemBackground))
            }
            .navigationTitle("Чат")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { viewModel.startBrowsing() }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .help("Поиск устройств")
                    Button(action: { viewModel.startAdvertising() }) {
                        Image(systemName: "dot.radiowaves.left.and.right")
                    }
                    .help("Оповещение устройств")
                }
            }
        }
    }
}
