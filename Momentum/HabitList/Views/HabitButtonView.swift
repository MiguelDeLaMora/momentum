//
//  HabitButtonView.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import SwiftUI

struct HabitButtonView: View {
    
    @ObservedObject var viewModel: HabitButtonViewModel
    
    init(habit: Habit) {
        viewModel = HabitButtonViewModel(habit: habit)
    }
    
    var body: some View {
        
        @Environment(\.colorScheme) var colorScheme
        
        let lightColors: [Color] = [Color(red: 1.0, green: 0.44, blue: 0.38), // Soft Coral
                                    Color(red: 1.0, green: 0.84, blue: 0.50), // Pale Orange
                                    Color(red: 0.53, green: 0.81, blue: 0.98)] // Sky Blue

        let darkColors: [Color] = [Color(red: 1.0, green: 0.25, blue: 0.51), // Vibrant Magenta
                                   Color(red: 1.0, green: 0.67, blue: 0.25), // Neon Orange
                                   Color(red: 0.25, green: 0.77, blue: 1.0)] // Electric Cyan
        
        Button(
            action: {
                viewModel.buttonHabitClicked()
            },
            label: {
                HStack (alignment: .center, spacing: 15) {
                    // Emoji
                    Text(viewModel.habit.emoji)
                        .font(Font.system(size: 60))
                        .padding(.leading)
                    // Habit Description (Title, description, streak)
                    VStack (alignment: .leading) {
                        Text(viewModel.habit.title)
                            .foregroundStyle(colorScheme == .light ? lightColors[1] : darkColors[1])
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(viewModel.habit.description)
                            .foregroundStyle(Color(.label))
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(viewModel.habit.streak) day streak")
                            .foregroundStyle(Color(.label))
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    
                    if (viewModel.habit.isDone) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.system(size: 50))
                            .foregroundStyle(colorScheme == .light ? lightColors[1] : darkColors[1])
                            .padding(.trailing)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                .shadow(color:Color(.systemGray) ,radius: 3)
            }
        )
    }
}

#Preview {
    HabitButtonView(habit: DeveloperPreview.habits[0])
}
