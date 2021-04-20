//
//  ContentView.swift
//  Guessica
//
//  Created by Максим Нуждин on 20.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...3)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.pink, .yellow, .blue, .yellow, .pink, .white, .blue, .white, .pink]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                VStack (spacing: 20){
                    HStack {
                        Spacer()
                        Text("Score: \(totalScore)").padding()
                    }
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                        .fontWeight(.black)
                }.foregroundColor(.white)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagPressed(number)
                        showingScore.toggle()
                    }, label: {
                        Image(countries[number])
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 5))
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    })
                }
                Spacer()
            }
            .alert(isPresented: $showingScore, content: {
                Alert(title: Text("\(scoreTitle)"), message: Text("Your current score is \(totalScore)"), dismissButton: .default(Text("ok")) {
                    askQuestion()
                })
            })
        }
    }
    
    func flagPressed(_ number: Int) {
        
        if number == correctAnswer {
            totalScore += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong! That is \(countries[number])"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
