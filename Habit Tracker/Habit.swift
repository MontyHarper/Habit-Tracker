//
//  Habit.swift
//  Habit Tracker
//
//  Created by Monty Harper on 2/12/24.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    var title: String = ""
    var description: String = ""
    var count: Int = 0
    
    init(title: String, description: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.count = 0
    }
}
