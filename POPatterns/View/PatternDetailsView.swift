//
//  PatternDetailsView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PatternDetailsView: View {
    
    var patterns: PatternModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [(Color(hex: "FFFFF")), (Color(hex: "00C2FF")) ],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                    VStack(spacing: 20) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.white)
                                .frame(width: 350, height: 200)
                            Image(patterns.imageName)
                                .resizable()
                                .frame(width: 350, height: 200)
                        }
                        VStack(spacing: 10) {
                            ScrollView {
                                Text(patterns.description)
                                    .padding()
                            }
                            .frame(width: 350, height: 350)
                            .background(Color.white)
                            .cornerRadius(15)
                            .lineLimit(nil)
                            ButtonView(name: "ADD TO FAVORITES" , action: {print("Added to favorites")})
                            ButtonView(name: "BACK TO LIST", action: {print("Back to list")})
                        }
                }
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(patterns.title)
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
        }
    }
}



//#Preview {
//    PatternDetailsView(patterns: PatternModel.ascendingTriangle)
//}
