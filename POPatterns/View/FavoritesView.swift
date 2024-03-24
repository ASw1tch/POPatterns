//
//  FavoritesView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @StateObject var favorites = FavoritesViewModel()
    
    let allPatterns: [PatternModel]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [(Color(hex: "FFFFF")), (Color(hex: "00C2FF")) ],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                if favoritesViewModel.favorites.isEmpty {
                    VStack(alignment: .center) {
                        Image(systemName: "icloud.slash")
                        Text("There's no favorites yet")
                    }.padding()
                        .bold()
                } else {
                    ScrollView {
                        ForEach(Array(favoritesViewModel.favorites), id: \.self) { patternID in
                            if let pattern = allPatterns.first(where: { $0.id == patternID }) {
                                NavigationLink(destination: PatternDetailsView(favoritesViewModel: favoritesViewModel, patterns: pattern)) {
                                    ButtonImageView(title: pattern.title, image: UIImage(imageLiteralResourceName: pattern.imageName))
                                }
                            } else {
                                Text("Pattern not found")
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//
//    FavoritesView()
//}
