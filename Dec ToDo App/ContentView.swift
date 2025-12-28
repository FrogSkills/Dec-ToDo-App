//
//  ContentView.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var subjects = ["Ues", "des"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(subjects, id: \.self) { subject in
                    NavigationLink {
                        DetailView(incomingWord: "EAT \(subject)")
                            .foregroundStyle(.orange)
                    } label: {
                        Text("\(subject)")
                    }
                }
            }
            .navigationTitle("Sure")
        }
    }
}

#Preview {
    ContentView()
}


//NavigationStack > List > NavigationLink

// ForEach(randomArrayName, id: \.self) {randomArraySingular in
//      NavigationLink {...rest of code

// The .navigationTitle needs to be between the NavigationStack & NavigationLink
// .navigationBarTitleDisplayMode(.-_-_-) right under.
// .listStyle(.plain) right under.

