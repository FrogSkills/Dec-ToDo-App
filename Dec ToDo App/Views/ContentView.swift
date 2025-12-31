//
//  ContentView.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI
import SwiftData


enum SortOptions: String, CaseIterable {
    case asEntered = "As Entered"
    case alphabetical = "A-Z"
    case chronological = "Date"
    case completed = "Not Done"
}

struct ContentView: View {
    @Query var subjects: [ToDoClass]
    @State private var sheetIsShowing = false
    @State private var sortSelection: SortOptions = .asEntered
    @State private var alphabetical: SortOptions = .alphabetical
    @State private var chronological: SortOptions = .chronological
    @State private var completed: SortOptions = .completed

    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(subjects) { subject in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: subject.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    subject.isCompleted.toggle()
                                    guard let _ = try? modelContext.save() else {
                                        print("Toggle check box did not work.")
                                        return
                                    }
                                }
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
//                        Image(systemName: "calendar")
//                            .foregroundStyle(.red, .gray, .blue)
                        
                        HStack {
                            Text(subject.dueDate.formatted(date: .abbreviated, time: .shortened))
                                .foregroundStyle(.secondary)
                            
                            if subject.reminderIsOn {
                                Image(systemName: "calendar.badge.clock")
                                    .symbolRenderingMode(.multicolor)
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
                ToolbarItem(placement: .bottomBar) {
                    Picker("", selection: $sortSelection) {
                        ForEach(SortOptions.allCases, id: \.self) { sortOrder in
                            Text(sortOrder.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(ToDoClass.preview)
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


// Add an HStack before te NavigataionLink. Right
//      Image(systemName: subject.isCompleted ? "checkmark.rectangle" : "rectangle")
//      .onTapGesture {
//          subject.isCompleted.toggle()

// But we need to save this change (any changes). So under the new toggle we add
//  guard let _ = try? modelContext.save() else {
//      print("Toggle check box did not work.")
//      return





// To work with the mock data from the model/class we change this .modelContainer in the preview to
// .modelContainer(ToDoClass.preview)




// we also add another VStack to the outside of the HStack to display sub info, then an HStack below the current HStack.

/*
 
 
 HStack {
     Text(subject.dueDate.formatted(date: .abbreviated, time: .shortened))
         .foregroundStyle(.secondary)
     
     if subject.reminderIsOn {
         Image(systemName: "calendar.badge.clock")
             .symbolRenderingMode(.multicolor)
     }
 
 */


/*
 
 To have the toolbar at the the bottom with the 4 probabilites:
 
 ToolbarItem(placement: .bottomBar) {
     Picker("", selection: $sortSelection) {
         ForEach(SortOptions.allCases, id: \.self) { sortOrder in
             Text(sortOrder.rawValue)
         }
     }
     .pickerStyle(.segmented)
 
 */
