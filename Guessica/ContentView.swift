//
//  ContentView.swift
//  Guessica
//
//  Created by Максим Нуждин on 20.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [.white, .pink, .yellow, .blue]), center: .top, startRadius: 10, endRadius: 450).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
