//
//  ArticleStorage.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import Foundation

final class ArticleStorage {
    func getArticles() -> [Article] {
        guard let url = Bundle.main.url(forResource: "Article", withExtension: "json") else {
            print("File not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let articles = try JSONDecoder().decode([Article].self, from: data)
            return articles
        } catch {
            print("Error reading or parsing file: \(error)")
            return []
        }
    }
    
    func getNewArticle() -> Article {
        let allArticles = getArticles()
        
        return allArticles.randomElement()!
    }
}
