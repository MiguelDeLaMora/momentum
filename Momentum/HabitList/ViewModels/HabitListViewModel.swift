//
//  HabitListViewModel.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

class HabitListViewModel: ObservableObject{
    @Published var habits = [Habit]()
    @Published var dateString: String = ""
    init() {
        refreshHabits()
        dateString = updateDateString()
    }
    
    func updateDateString() -> String {
        let currentDate = Date()
        
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        
        return formatter.string(from: currentDate)
    }
    
    func onAddHabitDismissed(){
        refreshHabits()
    }
    
    func refreshHabits(){
        habits = DeveloperPreview.habits
    }
}
