//
//  AddHabitView.swift
//  Momentum
//
//  Created by Miguel De La Mora on 04/01/25.
//

import SwiftUI

struct AddHabitView: View {
    
    @State var emoji: String = ""
    @State var title: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            // Emoji Picker
            TextField("📱", text: $emoji.max(1))
                .frame(width: 65)
                .font(.system(size: 60))
                .padding(.top, 30)
            
            // Title
            TextField("Title", text: $title.max(25))
                .font(.title)
                .fontWeight(.bold)
            
            
            // Description
            TextField("Description", text: $description.max(70), axis: .vertical)
                .font(.title2)
                .multilineTextAlignment(.leading)
                
            
            
            // Add Button
            Button(
                action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                label: {
                    Text("Add")
                        .foregroundStyle(.white)
                        .padding()
                        .fontWeight(.bold)
                        .background(.orange)
                        .cornerRadius(10)
                }
            )
            
            Spacer()
            // - Want to Save, Erase Data and Dismiss Sheet
        }
        .padding()
    }
        
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

#Preview {
    AddHabitView()
}
