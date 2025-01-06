//
//  Habit.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

struct Habit: Identifiable, Encodable, Decodable{
    let id: String
    var title: String
    var emoji: String
    var description: String
    var streak: Int
    var isDone: Bool = false
}
