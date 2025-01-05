//
//  HabitListViewModel.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

class HabitListViewModel: ObservableObject{
    @Published var habits = [Habit]()
    
    init() {
        habits = DeveloperPreview.habits
    }
}
