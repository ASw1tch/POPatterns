//
//  FavoritesViewModel.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 24.3.24..
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites: Set<Int>
    
    init() {
        favorites = []
    }

    func contains(_ pattern: PatternModel) -> Bool {
        favorites.contains(pattern.id)
    }
    
    func addToFavorites(_ pattern: PatternModel) {
        favorites.insert(pattern.id)
        
    }
    
    func removeFromFavorites(_ pattern: PatternModel) {
        favorites.remove(pattern.id)
        
    }
}
