//
//  ButtonImageView.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 19.3.24..
//

import SwiftUI

struct ButtonImageView: View {
    
    var title: String
    var image: UIImage
    var action: () -> Void
    
    init(title: String, image: UIImage, action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.action = action
    }
    
    var body: some View {
        
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 350, height: 150)
                        .tint(Color.white)
                    ZStack(alignment: .leading) {
                        HStack {
                            Text(title)
                                .font(.title3)
                                .bold()
                                .textCase(.uppercase)
                                .frame(alignment: .leading)
                                .padding()
                            Image(systemName: "arrow.right")
                                .padding()
                                .foregroundColor(.black)
                        }
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 350, height: 150)
                            .opacity(0.3)
                            .blur(radius: 3.0)
                }
            }
        }
    }
}

#Preview {
    ButtonImageView(title: "descending triangle", image: UIImage(imageLiteralResourceName: "descending-triangle"), action: {print("button tapped")})
}
