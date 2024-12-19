//
//  ButtonPriorityModifier.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct ButtonPriorityModifier: ViewModifier {
    
    private let priority: ButtonPriority
    private let backgroundColor: Color
    private let textColor: Color
    
    @ScaledMetric var underLineSpacing = 25
    
    
    init(_ priority: ButtonPriority = .primary) {
        self.priority = priority
        
        switch priority {
        case .primary, .secondary:
            self.backgroundColor = Color(uiColor: .systemGreen).opacity(0.35)
            self.textColor = .green
        case .link:
            self.backgroundColor = .clear
            self.textColor = Color(uiColor: .systemGreen)
        case .listRow:
            self.backgroundColor = Color(uiColor: .label).opacity(0.2)
            self.textColor = Color(uiColor: .label).opacity(0.8)
        }
    }
    
    func body(content: Content) -> some View {
        if priority == .link {
            content
                .font(.system(.callout, design: .rounded, weight: .bold))
                .foregroundStyle(textColor)
                .overlay {
                    Rectangle()
                        .frame(height: 2)
                        .padding(.top, underLineSpacing)
                        .foregroundStyle(textColor)
                }
        } else if priority == .listRow {
            content
                .font(.system(.callout, design: .rounded, weight: .bold))
                .foregroundStyle(textColor)
                .ignoresSafeArea()

        } else if priority == .secondary {
            content
                .font(.system(.callout, design: .rounded, weight: .bold))
                .padding(.horizontal)
                .frame(height: 50)
                .foregroundStyle(textColor)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))

        } else {
            content
                .font(.system(.callout, design: .rounded, weight: .bold))
                .padding(.horizontal)
                .frame(height: 50)
                .foregroundStyle(textColor)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10))
        }

    }
}

enum ButtonPriority {
    case primary
    case secondary
    case link
    case listRow
}

extension View {
    func buttonPriority(_ priority: ButtonPriority) -> some View {
        self.modifier(ButtonPriorityModifier(priority))
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
        FRNavigationLink(.listRow) {
            Text("List row")
        } label: {
            Label("Go to List", systemImage: "note.text")
        }
    }
}
