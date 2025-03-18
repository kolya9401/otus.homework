//
//  Article.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import Foundation

struct Article: Identifiable, Decodable, Hashable {
    let id: UUID
    let title: String
    let content: String
}

extension Article {
    static func make(title: String, content: String) -> Article {
        .init(id: UUID(), title: title, content: content)
    }
}
