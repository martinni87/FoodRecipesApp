//
//  HeaderComponent.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import SwiftUI

struct HeaderComponent: View {
    
    @ScaledMetric var height = 100
    var body: some View {
        Rectangle()
            .frame(height: height)
            .shadow(radius: 15, y: 5)
            .foregroundStyle(.accent.opacity(0.8))
            .overlay {
                HStack {
                    VStack(alignment: .leading){
                        Text("My cooking book")
                        Text("Eat well!")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    Image(systemName: "carrot.fill")
                    Spacer()
                }
                .foregroundStyle(.white)
                .font(.title2)
                .fontDesign(.serif)
                .fontWeight(.black)
                .padding()
            }
            
    }
}

#Preview {
    HeaderComponent()
}
