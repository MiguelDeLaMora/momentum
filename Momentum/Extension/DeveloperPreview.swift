//
//  DeveloperPreview.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import Foundation

struct DeveloperPreview {
    // MARK: - HABITS
    static let habits: [Habit] = [
        .init(
            id: NSUUID().uuidString,
            title: "Meditation",
            emoji: "🧘",
            description: "Take 10 minutes to breathe",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            title: "Workout",
            emoji: "💪",
            description: "Go to the gym at least 30 minutes",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            title: "Social",
            emoji: "📱",
            description: "Call at least one relative",
            streak: 0
        )
    ]
}
