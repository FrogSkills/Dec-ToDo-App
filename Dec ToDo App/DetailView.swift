//
//  DetailView.swift
//  Dec ToDo App
//
//  Created by Miguel on 12/27/25.
//

import SwiftUI

struct DetailView: View {
    @State var incomingWord: String
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now+(24*60*60)
    @State private var notes = ""
    @State private var isCompleted = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List{
            TextField("Incoming text:", text: $incomingWord)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            
            Text("Notes:")
                .padding(.top)
            
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Has it been finished", isOn: $isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
            
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //TODO: Save code
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(incomingWord: "")
    }
}


// create a var (not private) that has its value declared.

// DetailView(randomVarName: actualRandomValue) in the #Preview
// place the declared var in the detail view and give it any random value.

// @State private randomName = Date.now(24*60*60)


// TextField("", text: $randomName, axis: .vertical)


// See which views have axis.

// .textFieldStyle(.roundedBorder)


// .disabled()


//  For a toolbar We do not need another NavigationStack since we inherit the one from the main page because this one is within that stack. BUT, we need to embed the #DetailView in the #Preview in a NavigationStack

// . toolbar{
//      ToolbarItem(placement: .topBarTrailing) {
//          here we can insert a button if we want to (at the moment we always)


// .navigationBarBackButtonHidden
