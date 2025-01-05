//
//  HabitButtonViewModel.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

class HabitButtonViewModel: ObservableObject {
    @Published var habit: Habit
    
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
}
