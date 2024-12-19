//
//  FRNavigationLink.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct FRNavigationLink<Destination: View, Label: View>: View {
    
    private let destination: () -> Destination
    private let label: () -> Label
    private let priority: ButtonPriority
    
    init(_ priority: ButtonPriority = .primary, destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
        self.priority = priority
        self.destination = destination
        self.label = label
    }
    
    var body: some View {
        NavigationLink(destination: destination()) {
            label()
        }
        .buttonPriority(priority)
    }
}

#Preview {
    NavigationStack {
        FRNavigationLink(.primary) {
            Text("Primary")
        } label: {
            Label("Go to Primary", systemImage: "apple.logo")
        }
        FRNavigationLink(.secondary) {
            Text("Secondary")
        } label: {
            Label("Go to Secondary", systemImage: "pc")
        }
        FRNavigationLink(.link) {
            Text("Link")
        } label: {
            Label("Go to Link", systemImage: "link")
        }
    }
}
