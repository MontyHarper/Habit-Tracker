//
//  DetailView.swift
//  Habit Tracker
//
//  Created by Monty Harper on 2/13/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @Binding var habit: Habit

    var body: some View {
        
        NavigationStack {
            Form {
                Section("Edit") {
                    HStack {
                        Text("Title:")
                            .fontWeight(.bold)
                        TextField("Title", text: $habit.title)
                    }
                    HStack {
                        Text("Description:")
                            .fontWeight(.bold)
                        TextField("Description", text: $habit.description, axis: .vertical)
                            
                    }
                }
                Section("Count") {
                    HStack {
                        Button(action: {
                            habit.count -= 1
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                        })
                        .buttonStyle(.borderless)
                        
                        Spacer()
                        
                        Text(String(habit.count))
                            .font(.largeTitle)
                        
                        Spacer()
                        Button(action: {
                            habit.count += 1
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        })
                        .buttonStyle(.borderless)

                    }
                    .frame(maxWidth: .infinity)
                }

                
            }
            .navigationTitle("Habit: \(habit.title)")
        }
    }
}

#Preview {
    @State var habit = Habit(title:"Eat", description:"fruits and veggies")
    
    return
    DetailView(habit: $habit)
}

