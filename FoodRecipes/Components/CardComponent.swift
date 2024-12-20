//
//  CardComponent.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 19/12/24.
//

import SwiftUI

struct CardComponent: View {
    
    let recipe: Recipe
    let numberOfColumns: Int
    
    var body: some View {
        CardImageComponent(recipe: recipe)
            .scaledToFit()
            .overlay {
                VStack {
                    Spacer()
                    CardTextComponent(recipe: recipe)
                }
            }
    }
}

#Preview("Sample 1") {
    CardComponent(recipe: Recipe.sampleRecipes[0], numberOfColumns: 0)
}
#Preview("Sample 2") {
    CardComponent(recipe: Recipe.sampleRecipes[1], numberOfColumns: 1)
}
#Preview("Sample 3") {
    CardComponent(recipe: Recipe.sampleRecipes[2], numberOfColumns: 2)
}

struct CardImageComponent: View {
    
    let recipe: Recipe

    var body: some View {
        Image(recipe.imageResource)
            .resizable()
    }
}

struct CardTextComponent: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(recipe.title)
                    .lineLimit(1)
                    .font(.title2)
                    .bold()
                Text(recipe.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.caption)
            }
            .padding()
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                Text(recipe.hearts)
                Text(recipe.difficulty.value)
                Text("\(recipe.preparationTimeInMinutes)-\(recipe.maximumTimeExpected) min")
            }
            .font(.caption)
            .bold()
            .padding()
        }
        .fontDesign(.rounded)
        .foregroundStyle(Color(uiColor: .label))
        .background(Color(uiColor: .systemBackground).opacity(0.55))
    }
}
