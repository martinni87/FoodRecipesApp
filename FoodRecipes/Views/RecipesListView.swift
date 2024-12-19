//
//  RecipesListView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 19/12/24.
//

import SwiftUI

struct RecipesListView: View {
    
    let recipes: [Recipe]
    let backgroundColor = Color.mint.opacity(0.15)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        DetailViewHeaderComponent(recipe: recipe)
                    }
                }
            }
        }
        .background(backgroundColor)
    }
}

#Preview {
    RecipesListView(recipes: Recipe.sampleRecipesList)
}
