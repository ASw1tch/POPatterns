//
//  PatternDetailsView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PatternDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
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
                            ButtonView(name: "BACK TO LIST", action: {
                                self.presentationMode.wrappedValue.dismiss()
                            })
                        }
                }
            }.navigationBarBackButtonHidden()
             .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        if patterns.title.count > 15 {
                            Text(patterns.title)
                                .font(.system(size: 25))
                                .bold()
                        } else {
                            Text(patterns.title)
                                .font(.title)
                                .bold()
                        }
                    }
                }
            }
        }
    }
}



//#Preview {
//    PatternDetailsView(patterns: PatternModel.ascendingTriangle)
//}
