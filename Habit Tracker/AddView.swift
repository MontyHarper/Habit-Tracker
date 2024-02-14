//
//  AddView.swift
//  Habit Tracker
//
//  Created by Monty Harper on 2/14/24.
//

import Foundation
import SwiftUI

struct AddView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var habitsList: HabitsList
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Habit", text: $title)
                TextField("Description", text: $description)
                
                Section {
                    Button("Save") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                }
                
            }
            .onDisappear() {
                let newHabit = Habit(title: title, description: description)
                habitsList.habits.append(newHabit)
            }
            .navigationTitle("New Habit")
        }
    }
}

#Preview {
    AddView(habitsList: HabitsList())
}
