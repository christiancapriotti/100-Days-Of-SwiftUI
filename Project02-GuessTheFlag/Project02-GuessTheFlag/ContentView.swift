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
    
    @State private var isCorrect = false
    @State private var score = 0
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        
                        Text("\(countries[correctAnswer])")
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
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
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 5))
            }
            .navigationTitle("Guess The Flag")
            .navigationBarTitleDisplayMode(.inline)

        }
        .alert(isCorrect ? "Correct" : "Incorrect", isPresented: $showAlert) {
            Button("OK") {
                nextRound()
            }
        } message: {
            Text("Your score is: \(score)")
        }
    }
    
    private func flagTapped(num: Int) {
        if num == correctAnswer {
            isCorrect = true
            score += 1
        } else {
            isCorrect = false
        }
        
        showAlert = true
    }
    
    private func nextRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    ContentView()
}
