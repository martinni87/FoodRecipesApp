//
//  AdaptiveScalingModifier.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct AdaptiveScalingModifier: ViewModifier {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    func body(content: Content) -> some View {
        if verticalSizeClass == .regular {
            content
                .scaledToFit() // Landscape: scaleToFit
        } else {
            content
                .scaledToFill() // Portrait: scaleToFill
                .frame(height: 180)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8))
//                .padding()
        }
    }
}

extension View {
    func adaptiveScaling() -> some View {
        self.modifier(AdaptiveScalingModifier())
    }
}
