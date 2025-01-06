//
//  HabitService.swift
//  Momentum
//
//  Created by Miguel De La Mora on 05/01/25.
//

import Foundation
import SwiftUI

class HabitService{
    @AppStorage("HABITS_KEY") var savedHabits: Data = Data()
    private var habits: [Habit] = []
    
    static let shared = HabitService()
    
    init () {
        habits = retrieveHabits()
    }
    
    // -MARK: Data Conversion
    // Save
    func saveHabits(){
        // Convert Data to JSON
        guard let habitsJSON = try? JSONEncoder().encode(habits) else { return }
        
        self.savedHabits = habitsJSON
    }
    // Retrieve
    func retrieveHabits() -> [Habit] {
        guard let decodedHabit = try? JSONDecoder().decode([Habit].self, from: savedHabits) else { return [] }
        
        return decodedHabit
    }
    // -MARK: Data Queries
    // Add
    func addHabit(_ habit: Habit){
        habits.append(habit)
        saveHabits()
    }
    // Delete
    
    func deleteHabit(_ habit: Habit){
        habits.removeAll(where: {$0.id == habit.id})
        saveHabits()
    }
}
