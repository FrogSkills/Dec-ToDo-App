//
//  ContentView.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var subjects: [ToDoClass]
    @State private var sheetIsShowing = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(subjects) { subject in
                    NavigationLink {
                        DetailView(classHolderObject: subject)
                            .foregroundStyle(.orange)
                    } label: {
                        Text(subject.incomingWord)
                    }
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(subject)
                            guard let _ = try? modelContext.save() else {
                                print("Save after delet on ContentView did not work")
                                return
                            }
                        }
                    }
                }
            }
            .navigationTitle("Sure")
            .sheet(isPresented: $sheetIsShowing) {
                NavigationStack {
                    DetailView(classHolderObject: ToDoClass())
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
        .modelContainer(for: ToDoClass.self, inMemory: true)
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


// import SwiftData

// every page/file that will use SwiftData will need a container and context

// @Environment(\.modelContext) var modelContext


// .modelContainer(for: ToDoClass.self, inMemory: true)  in the #Preview


//     @Query var toDos: [ToDoClass]
// DO that instead of the array we had.
// @Query fetches data from SwiftData's ModelContainer, so they can be dispalyed in SwiftUI Views.
// @Query varibales will also trigger View updates on every change data(similar to how @State works). If you are swift experienced, SwiftData classes are automatically Observable & Identifiable. You don't add anything else to get this.

// Now we can get rid of the id: \.self since SwiftData creates a unique identifiable.


// The variable name (in this case, subject) of that Query is now used in the following way:
//   ForEach(subjects) { subject in
//    NavigationLink {
//      DetailView(classHolderObject: subject)



/*
 
 
 .swipeActions {
     Button("Delete", role: .destructive) {
         modelContext.delete(subject)
            guard let _ = try? modelContext.save() else {
                print("Save after delet on ContentView did not work")
                return
            }
     }
 }
 
 
 */
