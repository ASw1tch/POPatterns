//
//  PatternsView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PatternsView: View {
    
    @State private var patterns: [PatternModel] = []
    @State var selectedPattern: PatternModel?
    
    let favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [(Color(hex: "FFFFF")), (Color(hex: "00C2FF")) ],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 10) {
                        NavigationLink(destination: PNLCalculatorView(), label: {
                            Text("PNL ASSISTANT")
                            Image(systemName: "chevron.compact.forward")
                        })
                        .padding()
                        .font(.subheadline)
                        .frame(width: 360)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(10)
                        
                        ForEach(patterns, id: \.self) { pattern in
                            NavigationLink(destination: PatternDetailsView(favoritesViewModel: favoritesViewModel, patterns: pattern)) {
                                ButtonImageView(title: pattern.title, image: UIImage(imageLiteralResourceName: pattern.imageName))
                            }
                        }
                    }
                }.padding()
            }.toolbar {
                ToolbarItemGroup(placement: .automatic) {
                                HStack(spacing: 25) {
                                    Text("PATTERNS")
                                        .font(.title)
                                        .bold()
                                        .foregroundStyle(.primary)
                                    Spacer()
                                    NavigationLink("FAVORITES", destination: FavoritesView(favoritesViewModel: favoritesViewModel, allPatterns: patterns))
                                        .font(.title)
                                        .bold()
                                        .foregroundStyle(Color(hex: "8D9192"))
                                }
                            }
                        }
        }.onAppear {
            if let data = PatternJSON.data {
                do {
                    patterns = try JSONDecoder().decode([PatternModel].self, from: data)
                } catch {
                    print("Error decoding patterns: \(error)")
                }
            }
        }
    }
}

#Preview {
    PatternsView()
}
