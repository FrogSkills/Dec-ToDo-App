//
//  ToDoWindow.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/28/25.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDoClass {
    var incomingWord: String
    var reminderIsOn = false
    var dueDate = Date.now+(24*60*60)
    var notes = ""
    var isCompleted = false
    
    init(incomingWord: String = "Defult custom string", reminderIsOn: Bool = false, dueDate: Date = Date.now+(24*60*60), notes: String = "", isCompleted: Bool = false) {
        self.incomingWord = incomingWord
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
    
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDoClass.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add Mock Data
        container.mainContext.insert(ToDoClass(incomingWord: "First mock", reminderIsOn: true, dueDate: Date.now, notes: "Notes on first mock", isCompleted: false))
        container.mainContext.insert(ToDoClass(incomingWord: "Second mock", reminderIsOn: false, dueDate: Date.now, notes: "Notes on second mock", isCompleted: true))
        container.mainContext.insert(ToDoClass(incomingWord: "Third mock", reminderIsOn: false, dueDate: Date.now, notes: "Notes on third mock", isCompleted: false))
        container.mainContext.insert(ToDoClass(incomingWord: "Forth mock", reminderIsOn: true, dueDate: Date.now, notes: "Notes on forth mock", isCompleted: true))
        container.mainContext.insert(ToDoClass(incomingWord: "Fith mock", reminderIsOn: false, dueDate: Date.now, notes: "Notes on fifth mock", isCompleted: true))
        container.mainContext.insert(ToDoClass(incomingWord: "Sixth mock", reminderIsOn: false, dueDate: Date.now, notes: "Notes on sixth mock", isCompleted: false))
        
        return container
    }
}




// Create the class.

// import SwiftData

// @Model

// Now we will add modelContainer(for: randomClassName.self) in the project app file.



// TODO: will now create mock data using a static variable
// As a static variable, you can get at preview by refering to the class name, like this: ToDoClass.preview  you don't need to first create an object from the ToDoClass class.

// We do this static var inside the model/class.
