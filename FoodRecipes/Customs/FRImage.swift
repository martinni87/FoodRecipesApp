//
//  FRImage.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

enum FRScaleOption {
    case fit, fill
}

struct FRImage: View {
    
    private let resource: String
    private let scaleOption: FRScaleOption
    private let width: CGFloat
    
    init(_ resource: String, scaleOption: FRScaleOption = .fit, width: CGFloat = 150) {
        self.resource = resource
        self.scaleOption = scaleOption
        self.width = width
    }
    
    var body: some View {
        if scaleOption == .fit {
            Image(resource)
                .resizable()
                .scaledToFit()
                .frame(width: width)
        } else {
            Image(resource)
                .resizable()
                .scaledToFill()
                .frame(width: width)
        }
    }
}

#Preview {
    FRImage("avocadoHappyCircle")
}
