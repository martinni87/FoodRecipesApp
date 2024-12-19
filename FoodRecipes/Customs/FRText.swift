//
//  FRText.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct FRText: View {
    
    private let text: String
    private let spacing: CGFloat
    private let padding: CGFloat
    
    init(_ text: String, spacing: CGFloat = 0, padding: CGFloat = 0) {
        self.text = text
        self.spacing = spacing
        self.padding = padding
    }
    
    var body: some View {
        Text(text)
            .fontDesign(.rounded)
            .lineSpacing(spacing)
            .padding(padding)
    }
}

#Preview {
    FRText("Sample")
}
