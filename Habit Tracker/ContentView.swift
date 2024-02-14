//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Monty Harper on 2/12/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var habitsList = HabitsList()
    @State var showAddView = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach($habitsList.habits) {$habit in
                    
                    VStack (alignment: .leading) {
                        NavigationLink (destination: {
                            DetailView(habit: $habit)
                        },
                                        label: {
                            Text(habit.title)
                                .font(.title)
                                .fontWeight(.bold)
                        })
                    }
                }
                .onDelete(perform: { indexSet in
                    removeItems(indexSet)
                })
            }
            .navigationTitle("My Habits")
            
            .toolbar {
                Button("Add a New Habit", systemImage: "plus") {
                    showAddView = true
                }
            }
            .sheet(isPresented: $showAddView, content: {
                AddView(habitsList: habitsList)
            })
            
            
            
        }
        .padding()
    }
    
    func removeItems(_ offsets: IndexSet) {
        habitsList.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
