//
//  DetailView.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI

struct DetailView: View {
    var incomingWord: String
    
    var body: some View {
        Text("This is the DetailView")
            .foregroundStyle(.black)
        Text("The word of choice is \(incomingWord)")
            .foregroundStyle(.black)
    }
}

#Preview {
    DetailView(incomingWord: "")
}


// create a var (not @state & not private) that has its value declared.

// DetailView(randomVarName: actualRandomValue)
// place the declared var in the detail view and give it any random value.
