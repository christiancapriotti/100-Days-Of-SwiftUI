//
//  ContentView.swift
//  Project03-ViewsAndModifiers
//
//  Created by Christian Capriotti on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)    }
}

#Preview {
    ContentView()
}
