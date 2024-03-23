//
//  ResultPNLCalucationView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 23.3.24..
//

import SwiftUI

struct ResultPNLCalucationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [(Color(hex: "FFFFF")), (Color(hex: "00C2FF")) ],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    HStack {
                        Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                            Image(systemName: "arrow.left")
                            Text("BACK TO PATTERNS")
                            
                        }.padding()
                            .frame(width: 350)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    .font(.subheadline)
                    .frame(width: 350)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(10)
                    Spacer()
                    VStack(alignment: .center) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.white)
                                .frame(width: 350, height: 200)
                            Text("Result")
                                .padding()
                                .frame(width: 350, height: 200)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 13))
                        }
                    }
                        Spacer()
                        Spacer()
                        ButtonView(name: "RECALCULATE PNL" , action: { print("Calculating")})
                    
                }
            }.navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("PNL ASSISTANT")
                                .font(.largeTitle)
                                .bold()
                    }
                }
            }
        }
    }
}


#Preview {
    ResultPNLCalucationView()
}
