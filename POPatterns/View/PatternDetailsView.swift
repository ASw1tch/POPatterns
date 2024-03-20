//
//  PatternDetailsView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PatternDetailsView: View {
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
                            Image("ascending-triangle")
                                .resizable()
                                .frame(width: 350, height: 200)
                        }
                        VStack(spacing: 10) {
                            ScrollView {
                                Text("The ascending triangle is a bullish continuation pattern which signifies the continuation of an uptrend. Ascending triangles can be drawn onto charts by placing a horizontal line along the swing highs – the resistance – and then drawing an ascending trend line along the swing lows – the support. Ascending triangles often have two or more identical peak highs which allow for the horizontal line to be drawn. The trend line signifies the overall uptrend of the pattern, while the horizontal line indicates the historic level of resistance for that particular asset. The ascending triangle is a bullish continuation pattern which signifies the continuation of an uptrend. Ascending triangles can be drawn onto charts by placing a horizontal line along the swing highs – the resistance – and then drawing an ascending trend line along the swing lows – the support. Ascending triangles often have two or more identical peak highs which allow for the horizontal line to be drawn. The trend line signifies the overall uptrend of the pattern, while the horizontal line indicates the historic level of resistance for that particular asset.")
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
                        Text("PATTERN NAME")
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
        }
    }
}



#Preview {
    PatternDetailsView()
}
