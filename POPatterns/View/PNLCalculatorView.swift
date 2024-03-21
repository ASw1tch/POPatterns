//
//  PNLCalculatorView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PNLCalculatorView: View {
    
    @State private var entryPrice: Double
    @State private var exitPrice: Double
    @State private var sharesAmount: Int
    @State private var feePercentage: Int
    
    init(entryPrice: Double, exitPrice: Double, sharesAmount: Int, feePercentage: Int) {
        self._entryPrice = State(initialValue: entryPrice)
        self._exitPrice = State(initialValue: exitPrice)
        self._sharesAmount = State(initialValue: sharesAmount)
        self._feePercentage = State(initialValue: feePercentage)
    }
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [(Color(hex: "FFFFF")), (Color(hex: "00C2FF")) ],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    NavigationLink(destination: PatternsView(), label: {
                        Image(systemName: "arrow.left")
                        Text("BACK TO PATTERNTS")
                        
                    })
                    .padding()
                    .font(.subheadline)
                    .frame(width: 350)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(10)

                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.white)
                            .frame(width: 350, height: 200)
                        Text("PNL (Profit and Loss) is a crucial term in the context of trading and investing. It represents the net financial outcome of a trading position or investment over a certain period. You can calculate it by deducting the whole cost of purchasing an asset or investment from the total revenue you get when selling it.")
                            .padding()
                            .frame(width: 350, height: 200)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 13))
                    }
                    VStack(spacing: 15) {
                        TextField("", value: $entryPrice, formatter: NumberFormatter(),  prompt: Text("Entry Price").foregroundColor(Color(hex: "#13C0FF")))
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .keyboardType(.decimalPad)
                        
                        TextField("", value: $exitPrice, formatter: NumberFormatter(),  prompt: Text("Exit Price").foregroundColor(Color(hex: "#13C0FF")))
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .keyboardType(.decimalPad)
                        
                        TextField("", value: $sharesAmount, formatter: NumberFormatter(),  prompt: Text("Shares amount").foregroundColor(Color(hex: "#13C0FF")))
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .keyboardType(.decimalPad)
                        
                        TextField("", value: $feePercentage, formatter: NumberFormatter(),  prompt: Text("Percentage of fees on profit, if any").foregroundColor(Color(hex: "#13C0FF")))
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: 350)
                            .keyboardType(.decimalPad)
                        
                        
                        Spacer()
                        ButtonView(name: "CALCULATE PNL" , action: { print("Calculating")})
                    }
                }
            }.toolbar {
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
    PNLCalculatorView(entryPrice: 0, exitPrice: 0, sharesAmount: 0, feePercentage: 0)
}
