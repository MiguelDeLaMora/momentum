//
//  HabitListView.swift
//  Momentum
//
//  Created by Miguel De La Mora on 01/01/25.
//

import SwiftUI



struct HabitListView: View {
    
    @StateObject var viewModel = HabitListViewModel()
    @State var showAddHabitForm: Bool = false
    @State var isEditMode: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    let lightColors: [Color] = [Color(red: 1.0, green: 0.44, blue: 0.38), // Soft Coral
                                Color(red: 1.0, green: 0.84, blue: 0.50), // Pale Orange
                                Color(red: 0.53, green: 0.81, blue: 0.98)] // Sky Blue

    let darkColors: [Color] = [Color(red: 1.0, green: 0.25, blue: 0.51), // Vibrant Magenta
                               Color(red: 1.0, green: 0.67, blue: 0.25), // Neon Orange
                               Color(red: 0.25, green: 0.77, blue: 1.0)] // Electric Cyan
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 30) {
                
                // Motivational Header
                Text("Your Habits, Your Progress")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                VStack (alignment: .leading, spacing: 5) {
                    // Today´s date
                    Text(viewModel.dateString)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(colorScheme == .light ? lightColors[2] : darkColors[2])
                    
                    // List Streak
                    Text("🔥 1 Day Streak")
                        .font(.title3)
                }
                
                
                
                // Habit List
                
                // Button
                
                LazyVStack (spacing: 20) {
                    ForEach (viewModel.habits) { habit in
                        HabitButtonView(habit: habit, isEditMode: $isEditMode)
                    }
                }
                
                
                
                
                
                // Add Habit Button
                
                HStack {
                    Spacer()
                    Button(
                        action: {
                            showAddHabitForm.toggle()
                        },
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .font(Font.system(size: 50))
                                .foregroundStyle(colorScheme == .light ? lightColors[1] : darkColors[1])
                        }
                    )
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showAddHabitForm, onDismiss: viewModel.onAddHabitDismissed, content: {
            AddHabitView()
                .presentationDragIndicator(.visible)
        })
        .toolbar{
            ToolbarItem(placement: 
                    .topBarTrailing){
                        Button(isEditMode ? "Done" : "Edit"){
                            isEditMode.toggle()
                            viewModel.refreshHabits()
                }
            }
        }
    }
}

#Preview {
    HabitListView()
}
