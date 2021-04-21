//
//  countryImageLabel.swift
//  Guessica
//
//  Created by Максим Нуждин on 21.04.2021.
//

import SwiftUI

struct countryImageLabel: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 5))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct countryImageLabel_Previews: PreviewProvider {
    static var previews: some View {
        countryImageLabel(image: "pencil")
    }
}
