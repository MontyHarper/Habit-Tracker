//
//  HabitsList.swift
//  Habit Tracker
//
//  Created by Monty Harper on 2/12/24.
//

import Foundation
import SwiftUI

@Observable
class HabitsList {
    
    var habits = [Habit]() {
        didSet {
            storeHabits()
        }
    }
    
    init() {
        loadHabits()
    }
    
    func storeHabits() {
        do {
            let data = try JSONEncoder().encode(habits)
            UserDefaults.standard.set(data, forKey: "StoredHabits")
        } catch {
            return
        }
    }
    
    func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: "StoredHabits") {
            do {
                habits = try JSONDecoder().decode([Habit].self, from: data)
            } catch {
                habits = [Habit]()
            }
        } else {
            // Default data hardcoded for testing
            habits = [
                Habit(title: "Exercise", description: "get your ass off the couch"),
                Habit(title: "Read", description: "read a book every day"),
                Habit(title: "Code", description: "practice coding every day")
                ]
        }
    }
}
