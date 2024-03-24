//
//  PNLCalculatorView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct PNLCalculatorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var entryPrice = ""
    @State private var exitPrice = ""
    @State private var sharesAmount = ""
    @State private var feePercentage = ""
    
    @State private var showingAlert = false
    
    @State private var totalProfit = 0.0
    @State private var profitPercentage = 0.0
    
    @State private var showElements = true
    @State private var showResults = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [(Color(hex: "FFFFF")), (Color(hex: "00C2FF")) ],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
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
                    
                    if showResults {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.white)
                                .frame(width: 350, height: 200)
                            VStack(spacing: 20) {
                                HStack {
                                    self.totalProfit > 0 ? Text("PROFIT:") : Text("LOSS:")
                                    Text((String(format: "%.1f", self.totalProfit)))
                                }
                                Text("OR")
                                HStack {
                                    self.totalProfit > 0 ? Text("") : Text("-")
                                    Text("\(String(format: "%.1f", profitPercentage))%")
                                        .font(.title)
                                        .bold()
                                        .foregroundStyle(Color.init(hex: "#13C0FF"))
                                }
                            }
                            .padding()
                            .frame(width: 350, height: 200)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                        }
                    }
                    
                    if showElements {
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
                            TextField("Entry Price", text: $entryPrice)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .frame(width: 350)
                                .keyboardType(.decimalPad)
                                .onTapGesture {
                                    hideKeyboard()
                                }
                            
                            
                            TextField("Exit Price", text: $exitPrice)
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .frame(width: 350)
                                .keyboardType(.decimalPad)
                                .onTapGesture {
                                    hideKeyboard()
                                }
                            
                            TextField("Shares amount", text: $sharesAmount)
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .frame(width: 350)
                                .keyboardType(.decimalPad)
                                .onTapGesture {
                                    hideKeyboard()
                                }
                            TextField("Percentage of fees on profit, if any", text: $feePercentage)
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .frame(width: 350)
                                .keyboardType(.decimalPad)
                                .onTapGesture {
                                    hideKeyboard()
                                }
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("Invalid Input"), message: Text("Please Entry price, Exit price and Shares Amount"), dismissButton: .default(Text("OK")))
                        }
                    }
                    Spacer()
                    Button(action: {
                        if entryPrice.isEmpty || exitPrice.isEmpty || sharesAmount.isEmpty {
                            showingAlert = true
                        } else {
                            if feePercentage.isEmpty {
                                feePercentage = "0"
                            }
                            calculateProfit()
                            
                            showElements.toggle()
                            showResults.toggle()
                        }
                    })
                    {
                        if showResults == false {
                            Text("CALCULATE PNL")
                                .padding()
                                .frame(width: 350)
                                .foregroundColor(Color(hex: "#13C0FF"))
                                .background(.white)
                                .cornerRadius(10)
                        } else {
                            Text("RECALCULATE PNL")
                                .padding()
                                .frame(width: 350)
                                .foregroundColor(Color(hex: "#13C0FF"))
                                .background(.white)
                                .cornerRadius(10)
                        }
                    }
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
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func calculateProfit() {
        guard let entryPrice = Double(entryPrice),
              let exitPrice = Double(exitPrice),
              let sharesAmount = Double(sharesAmount),
              let fees = Double(feePercentage) else {
            return
        }
        
        let profit = (exitPrice - entryPrice) * sharesAmount
        self.totalProfit = profit
        
        if profit > 0 && fees > 0 {
            let feeAmount = profit * (fees / 100)
            self.totalProfit -= feeAmount
        }
        
        let initialInvestment = entryPrice * sharesAmount
        
        
        if self.totalProfit >= 0 {
            self.profitPercentage = (self.totalProfit / initialInvestment) * 100
        } else {
            let loss = abs(self.totalProfit)
            self.profitPercentage = (loss / initialInvestment) * 100
        }
        
        print("Total Profit: \(self.totalProfit)")
        print("Profit Percentage: \(String(format: "%.1f", self.profitPercentage))%")
    }
}


#Preview {
    PNLCalculatorView()
}
