//
//  AddHabitViewModel.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

class AddHabitViewModel: ObservableObject{
    @Published var emoji: String = ""
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var error: String = ""
    
    func addNewHabit() -> Bool {
        
        // Validation
        
        if(validateNewHabit()){
            
            error = ""
            
            // Saving
            HabitService.shared.addHabit(Habit(
                    id: UUID().uuidString,
                title: title,
                emoji: emoji,
                description: description,
                streak: 0
                ))
            
            // Erase Data
            eraseTextField()
        } else{
            error = "Please make sure all fields are filled."
            return false
        }
        return true
    }
    
    func validateNewHabit() -> Bool{
        return emoji.count > 0 && title.count > 1 && description.count > 1
    }
    
    func eraseTextField(){
        emoji = ""
        title = ""
        description = ""
    }
}
