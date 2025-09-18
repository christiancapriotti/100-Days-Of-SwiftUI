//
//  ContentView.swift
//  Project01-WeSplit
//
//  Created by Christian Capriotti on 9/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedStudent = "Harry"
    
    private let students = ["Harry", "Hermoine", "Ron"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    ContentView()
}
