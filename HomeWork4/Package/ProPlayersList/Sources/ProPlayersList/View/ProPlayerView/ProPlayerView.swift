//
//  ProPlayerView.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import SwiftUI

struct ProPlayerView: View {
    private let viewModel: ProPlayerViewModel
    
    init(viewModel: ProPlayerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            if let avatar = viewModel.avatar {
                AsyncImage(
                    url: avatar,
                    content: { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
                )
            }
            Text(viewModel.name)
                .padding(.leading, 8)
            
            Spacer()
            
            Text(viewModel.teamName ?? "")
                .padding(.trailing, 8)
                .foregroundStyle(.gray)
        }
    }
}
