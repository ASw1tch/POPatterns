//
//  ButtonView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct ButtonView: View {
    var name: String
    var action: () -> Void
    
    init(name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }
    var body: some View {
            Button(action: {action()}) {
                Text(name)
                    .padding()
                    .frame(width: 350)
                    .foregroundColor(Color(hex: "#13C0FF"))
                    .background(.white)
                    .cornerRadius(10)
        }
    }
}

#Preview {
    ButtonView(name: "Buttonka", action: {print("Buttonkla pressed")})
}
