//
//  ContentView.swift
//  Momentum
//
//  Created by Miguel De La Mora on 01/01/25.
//

import SwiftUI

struct WelcomeView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Environment(\.colorScheme) var colorScheme
    
    let lightColors: [Color] = [Color(red: 1.0, green: 0.44, blue: 0.38), // Soft Coral
                                Color(red: 1.0, green: 0.84, blue: 0.50), // Pale Orange
                                Color(red: 0.53, green: 0.81, blue: 0.98)] // Sky Blue

    let darkColors: [Color] = [Color(red: 1.0, green: 0.25, blue: 0.51), // Vibrant Magenta
                               Color(red: 1.0, green: 0.67, blue: 0.25), // Neon Orange
                               Color(red: 0.25, green: 0.77, blue: 1.0)] // Electric Cyan
    
    struct DistortedCircle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.width
            let height = rect.height

            // Create a wavy, distorted shape
            path.move(to: CGPoint(x: width * 0.5, y: 0))
            path.addCurve(to: CGPoint(x: width, y: height * 0.3),
                          control1: CGPoint(x: width * 0.7, y: height * -0.2),
                          control2: CGPoint(x: width * 1.2, y: height * 0.1))
            path.addCurve(to: CGPoint(x: width * 0.5, y: height),
                          control1: CGPoint(x: width * 0.8, y: height * 0.9),
                          control2: CGPoint(x: width * 0.3, y: height * 1.2))
            path.addCurve(to: CGPoint(x: 0, y: height * 0.7),
                          control1: CGPoint(x: width * -0.2, y: height * 1.1),
                          control2: CGPoint(x: width * 0.1, y: height * 0.8))
            path.addCurve(to: CGPoint(x: width * 0.5, y: 0),
                          control1: CGPoint(x: width * 0.2, y: height * 0.2),
                          control2: CGPoint(x: width * 0.3, y: height * -0.2))

            path.closeSubpath()
            return path
        }
    }
    var body: some View {
        NavigationView{
            ZStack{
                // MARK: Background
                ZStack {
                    DistortedCircle()
                        .foregroundStyle(colorScheme == .light ? lightColors[0] : darkColors[0])
                        .frame(width: screenWidth / 1.3, height: screenWidth / 1.3)
                        .offset(x: -screenWidth / 2, y: -screenHeight / 2)
                    
                    DistortedCircle()
                        .foregroundStyle(colorScheme == .light ? lightColors[1] : darkColors[1])
                        .frame(width: screenWidth / 1.1, height: screenWidth / 1.1)
                        .offset(x: screenWidth / 3, y: screenHeight / 3)
                    
                    DistortedCircle()
                        .foregroundStyle(colorScheme == .light ? lightColors[2] : darkColors[2])
                        .frame(width: screenWidth / 1.7, height: screenWidth / 1.7)
                        .offset(x: screenWidth / 4, y: -screenHeight / 4)
                }
                
                
                
                // MARK: Content
                VStack (alignment: .leading, spacing: 15) {
                    
                    // App Name
                    Text("Momentum")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    // Slogan
                    Text("The Habit Tracker that will change your life")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // Get Started Button
                    NavigationLink (destination: HabitListView().navigationBarBackButtonHidden()){
                            Text("Get Started")
                                .foregroundStyle(.white)
                                .padding()
                                .fontWeight(.bold)
                                .background(.orange)
                                .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
