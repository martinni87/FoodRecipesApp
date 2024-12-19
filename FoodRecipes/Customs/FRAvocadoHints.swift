//
//  FRAvocadoHints.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct FRAvocadoHints: View {
    
    private let text: String
    private let height: CGFloat
    
    init(_ text: String, height: CGFloat = 150) {
        self.text = text
        self.height = height
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            FRTextSandwich("sandwich", text)
                .frame(height: height)
            FRImage("avocadoHappyNoBackground", width: height/3*2)
        }
        
    }
}


#Preview {
    FRAvocadoHints(loremIpsum.extractSubstring(length: 50))
}
