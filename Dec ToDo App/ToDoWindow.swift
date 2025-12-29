//
//  ToDoWindow.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/28/25.
//

import Foundation
import SwiftData


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
}




// Create the class.

// import SwiftData

// @Model

// Now we will add modelContainer(for: randomClassName.self) in the project app file.
