//
//  RecipeDescriptionView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 17/12/24.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    let backgroundColor = Color.mint.opacity(0.15)
    @State var openIngredientsList = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                DetailViewHeaderComponent(recipe: recipe)
                    .shadow(radius: 5, x:0, y: 5)
                    .background(backgroundColor)
                DetailViewBodyComponent(recipe: recipe, actionOneState: $openIngredientsList)
                    .padding(.horizontal)
                    .background(backgroundColor)
            }
            .navigationTitle(recipe.title)
//            .toolbarVisibility(.hidden, for: .automatic)
        }
        .sheet(isPresented: $openIngredientsList) {
            List(recipe.ingredients) { ingredient in
                Text("\(ingredient.name) - \(ingredient.quantity) \(ingredient.unit.value)")
            }
            .navigationTitle("Ingredientes")
        }
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe.sampleRecipe)
}
