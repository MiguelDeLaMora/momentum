//
//  HabitButtonViewModel.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

class HabitButtonViewModel: ObservableObject {
    @Published var habit: Habit
    @Published var isDeleted: Bool = false
    @Published var buttonOpacity: Double = 1.0
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    func buttonHabitClicked(){
        habit.isDone.toggle()
        
        if (habit.isDone){
            habit.streak += 1
        } else {
            habit.streak -= 1
        }
    }
    
    func deleteHabit(){
        HabitService.shared.deleteHabit(habit)
        isDeleted = true
        buttonOpacity = 0.3
    }
}
