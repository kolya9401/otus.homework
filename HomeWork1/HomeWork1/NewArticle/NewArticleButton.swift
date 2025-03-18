//
//  NewArticleButton.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

struct NewArticleButton: UIViewRepresentable {
    let title: String
    let action: () -> Void
    
    func makeUIView(context: Context) -> some UIButton {
        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        let action = UIAction { _ in
            self.action()
        }
        
        let button = UIButton(configuration: configuration, primaryAction: action)
        
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print(context)
    }
}
