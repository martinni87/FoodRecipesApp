//
//  FRTextSandwich.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct FRTextSandwich: View {
    
    private let resource: String
    private let text: String
    private let width: CGFloat
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    init (_ resource: String, _ text: String, width: CGFloat = 200) {
        self.resource = resource
        self.text = text
        self.width = width
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Image(resource)
                    .resizable()
                FRText(text, spacing: 0)
                    .padding(.trailing, verticalSizeClass == .compact ? 150 : 80)
                    .padding(.leading, 15)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    FRTextSandwich("sandwich", loremIpsum.extractSubstring(start: 0, length: 400))
}

