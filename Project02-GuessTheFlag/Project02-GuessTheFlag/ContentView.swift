//
//  ContentView.swift
//  Project02-GuessTheFlag
//
//  Created by Christian Capriotti on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"
    ].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var round = 0
    @State private var selectedFlag = 0
    @State private var isCorrect = false
    @State private var showingScoreAlert = false
    @State private var showingGameOverAlert = false

    private let numRounds = 3
    
    private var scoreDisplay: String {
        "\(score)/\(round)"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 60) {
                    VStack {
                        Text("Tap the flag of...")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                        
                        Text("\(countries[correctAnswer])")
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                            .shadow(radius: 10.0)
                    }
                    
                    VStack(spacing: 30) {
                        ForEach(0..<3) { num in
                            Button {
                                flagTapped(num: num)
                            } label: {
                                Image("\(countries[num])")
                                    .clipShape(.capsule)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(25)
                    .background(.regularMaterial.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 5))
                    
                    
                    Text("Score: \(scoreDisplay)")
                        .foregroundStyle(.white)
                        .font(.title2)
                }
            }
            .navigationTitle("Guess The Flag")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .alert(isCorrect ? "Correct!" : "Incorrect!", isPresented: $showingScoreAlert) {
            Button("OK") { nextRound() }
        } message: {
            Text(isCorrect
                 ? "Your score is: \(scoreDisplay)"
                 : "You selected the flag of \(countries[selectedFlag])"
            )
        }
        .alert("Game over!", isPresented: $showingGameOverAlert) {
            Button("I'll play again!", role: .confirm) { nextGame() }
        } message: {
            Text("Your final score is: \(scoreDisplay)")
        }
    }
    
    
    private func flagTapped(num: Int) {
        round += 1
        selectedFlag = num
        
        if num == correctAnswer {
            isCorrect = true
            score += 1
        } else {
            isCorrect = false
        }
        
        if round == numRounds {
            showingGameOverAlert = true
        } else {
            showingScoreAlert = true
        }
    }
    
    private func nextRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func nextGame() {
        score = 0
        round = 0
        nextRound()
    }
    
}

#Preview {
    ContentView()
}
