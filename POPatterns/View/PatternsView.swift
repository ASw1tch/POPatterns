//
//  PatternsView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PatternsView: View {
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
                    
                    ButtonImageView(title: "ascending triangle", image: UIImage(imageLiteralResourceName: "ascending-triangle"), action: {print("Button tapped")})
                    
                    }
                }.padding()
            } .toolbar {
                ToolbarItemGroup(placement: .automatic) {
                    HStack(spacing: 25) {
                        Text("PATTERNS")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.primary)
                        Spacer()
                        NavigationLink("FAVORITES", destination: FavoritesView())
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(hex: "8D9192"))
                    }
                }
            }
        }
    }
}

#Preview {
    PatternsView()
}