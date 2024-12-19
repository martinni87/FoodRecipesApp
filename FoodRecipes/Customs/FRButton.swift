//
//  FRButton.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

public struct FRButton<Label>: View where Label: View {
    
    private let label: () -> Label
    private let action: () -> Void
    private let priority: ButtonPriority

    
    init(_ priority: ButtonPriority = .primary, action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.priority = priority
        self.action = action
        self.label = label
    }
    
    public var body: some View {
        Button(action: action) {
            label()
        }
        .buttonPriority(priority)
    }
}

#Preview {
    FRButton(.primary) {
        print("I'm a primary")
    } label: {
        Text("Primary print")
    }
    FRButton(.secondary) {
        print("I'm a secondary")
    } label: {
        Text("Secondary print")
    }
    FRButton(.link) {
        print("I'm a link")
    } label: {
        Text("Link print")
    }
}
