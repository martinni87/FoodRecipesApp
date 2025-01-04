//
//  ToolBarGridButtonComponent.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import SwiftUI

enum ButtonGridSize: Int {
    case list = 0
    case one = 1
    case two = 2
    case three = 3
}

struct ToolBarGridButtonComponent: View {
    
    @Binding var value: Int
    let size: ButtonGridSize
    
    var body: some View {
        Button {
            value = size.rawValue
        } label: {
            switch size {
            case .list:
                Image(systemName: "line.3.horizontal")
                    .padding(.vertical, 5)
                    .foregroundStyle(value == 0 ? .white : .accentColor)
                    .background( value == 0 ? Color.accentColor : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            case .one:
                Image(systemName: "square")
                    .foregroundStyle(value == 1 ? .white : .accentColor)
                    .background( value == 1 ? Color.accentColor : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            case .two:
                Image(systemName: "square.grid.2x2")
                    .foregroundStyle(value == 2 ? .white : .accentColor)
                    .background( value == 2 ? Color.accentColor : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            case .three:
                Image(systemName: "square.grid.3x2")
                    .foregroundStyle(value == 3 ? .white : .accentColor)
                    .background( value == 3 ? Color.accentColor : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}
