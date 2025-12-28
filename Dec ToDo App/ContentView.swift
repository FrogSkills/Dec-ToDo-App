//
//  ContentView.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var subjects = ["Ues", "des"]
    @State private var sheetIsShowing = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(subjects, id: \.self) { subject in
                    NavigationLink {
                        DetailView(incomingWord: "This is the incoming: \(subject)")
                            .foregroundStyle(.orange)
                    } label: {
                        Text("\(subject)")
                    }
                }
            }
            .navigationTitle("Sure")
            .sheet(isPresented: $sheetIsShowing) {
                NavigationStack {
                    DetailView(incomingWord: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
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

// . toolbar{
//      ToolbarItem(placement: .topBarTrailing) {
//          here we can insert a button if we want to (at the moment we always)


// When adding data (plus) / creating,  the sheet comes from the bottom up, not the right.

// add .sheet inside the NavigationStack, then add the window we want to popup (DetaiView window in this case) with the value that must be inputed.

// .sheet(isPresented: $randomValue) {
//      DetailView(incomingWord: "")
//  }

// There are no dismiss, cancel, or any buttons in the sheet. To show the ones we already have we need to embeed the DetailView(second window) (that is being called in the .sheet) in a NavigationStack.

// instead of .sheet we can use .fullScreenCover
