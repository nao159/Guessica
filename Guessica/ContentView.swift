//
//  ContentView.swift
//  Guessica
//
//  Created by Максим Нуждин on 20.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0..<3)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    
    @State private var animateCorrect = 0.0
    @State private var animateOpacity = 1.0
    @State private var wrongFlags = false
    @State private var correctFlag = false
    @State private var selectedFlag = 0
    
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
                
                ForEach(0..<3, id: \.self) { number in
                    Button(action: {
                        withAnimation {
                            selectedFlag = number
                            flagPressed(number)
                            showingScore.toggle()
                        }
                    }, label: {
                        countryImageLabel(image: countries[number])
                            .rotation3DEffect(
                                .degrees(number == correctAnswer ? animateCorrect : 0), axis: (x: 0, y: 1, z: 0))
                            .opacity(number != correctAnswer && correctFlag ? animateOpacity : 1)
                            .background(wrongFlags && selectedFlag == number ? Capsule(style: .circular).fill(Color.red).blur(radius: 30) : Capsule(style: .circular).fill(Color.clear).blur(radius: 0))
                            .opacity(wrongFlags && selectedFlag != number ? animateOpacity : 1)
                        
                        
                    })
                    .padding()
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
            withAnimation {
                animateCorrect += 360
                animateOpacity = 0.25
                correctFlag = true
            }
        } else {
            scoreTitle = "Wrong! That is \(countries[number])"
            withAnimation {
                animateOpacity = 0.25
                wrongFlags = true
            }
        }
    }
    
    func askQuestion() {
        wrongFlags = false
        correctFlag = false
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
