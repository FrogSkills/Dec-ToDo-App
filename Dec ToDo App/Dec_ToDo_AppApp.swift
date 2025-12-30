//
//  Dec_ToDo_AppApp.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI
import SwiftData

@main
struct Dec_ToDo_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoClass.self)
        }
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}


// import SwiftData


// added .modelContainer(for: randomClassName.self)


/*
 
 init() {
     print(URL.applicationSupportDirectory.path(percentEncoded: false))
 }
 
 add that just above the last }
 
 
 */
