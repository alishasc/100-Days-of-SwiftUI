//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alisha Carrington on 27/10/2024.
//

import SwiftUI

struct ContentView: View {
    // array of all country images to show in game
    // shuffled() automatically randomizes the array order
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    // Int storing which country image is correct - picks random number between 0 and 2
    @State private var correctAnswer = Int.random(in: 0...2)
    // controls whether the alert is shown
    @State private var showingScore = false
    // another alert to appear when user's answered 8 questions and finished game
    @State private var finishGame = false
    // title that will be shown in the alert
    @State private var scoreTitle = ""
    // user's score count
    @State private var score = 0
    // count number of questions - end game after 8 questions
    @State private var questionCount = 0
    
    // for animations
    @State private var animationAmount = 1.0
    @State private var selectedFlag = 0
    @State private var fullOpacity = true
    
    var body: some View {
        ZStack {
            // background color goes behind VStack
            // the two stops are the same so there's no gradient
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    // display 3 flag images as Buttons
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)

                            // track flag that's been tapped
                            selectedFlag = number
                            // spin tapped flag
                            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                                animationAmount += 360
                            }
                        } label: {
                            // calls custom view to get the first 3 flags from array. array is randomized so they change each time
                            FlagImage(countries: countries, number: number)
                        }
                        // animation for tapped flag
                        .rotation3DEffect(.degrees(selectedFlag == number ? animationAmount : .zero), axis: (x: 0, y: 1, z: 0))
                        // animations for others
                        .opacity((selectedFlag != number && !fullOpacity) ? 0.25 : 1)
                        .scaleEffect((selectedFlag != number && !fullOpacity) ? 0.75 : 1)
                        .animation(.default, value: (selectedFlag != number && !fullOpacity))
                        .alert(scoreTitle, isPresented: $showingScore) {
                            // dismiss button that calls the askQuestion() function to reset the game
                            Button("Continue", action: askQuestion)
                        } message: {
                            // message is under title on alert
                            Text("Your score is \(score)")
                        }
                        // when 8 questions have been answered - call reset() to play again
                        .alert(scoreTitle, isPresented: $finishGame) {
                            Button("Play Again", action: reset)
                        }
                    }
                }
                // modifiers for white background of titles and images
                .frame(maxWidth: .infinity)  // only uses horizontal space it needs to
                .padding(.vertical, 20)  // padding to both top and bottom - inside frame
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))  // rounded rectangle
                
                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
    }
    
    // runs when a flag Button is pressed
    func flagTapped(_ number: Int) {
        fullOpacity = false  // change opacity of unselected flags
        questionCount += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            // tells you the name of the flag you selected - countries = array
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        // when questionCount == 8 the game is finished
        if questionCount == 8 {
            // show final score
            scoreTitle = "You scored \(score)/8"
            // trigger alert to be presented and reset game
            finishGame = true
        } else {
            // trigger alert and set up for next level
            showingScore = true
        }
    }
    
    // sets the next level by reshuffling the array and setting a new Int as the correctAnswer
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 1...2)
        fullOpacity = true  // reset all flags full opacity
    }
    
    // called by second alert once user's answered 8 questions
    // resets everything to start new game
    func reset() {
        askQuestion()
        score = 0
        questionCount = 0
    }
}

struct FlagImage: View {
    // properties that need to be passed into this struct when called
    var countries: [String]
    var number: Int
    
    var body: some View {
        // create this view based on above info
        Image(countries[number])
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
