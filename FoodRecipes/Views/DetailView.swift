//
//  DetailView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import SwiftUI

struct DetailView: View {
    
    let recipe: Recipe
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottom) {
                    Image(recipe.imageResource)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    HStack {
                        Spacer()
                        Text(recipe.title)
                        Spacer()
                    }
                    .padding(.vertical)
                    .font(.title)
                    .bold()
                    .background{
                        Color(uiColor: .systemBackground).opacity(0.55)
                    }
                }
                VStack {
                    HStack {
                        Text(recipe.hearts)
                        Spacer()
                        VStack {
                            Text(recipe.difficulty.value)
                            Text("\(recipe.preparationTimeInMinutes) - \(recipe.maximumTimeExpected) min")
                        }
                    }
                    .padding(.bottom)
                    Text(recipe.description)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal)
            .navigationTitle(recipe.title)
        }
    }
}

#Preview {
    DetailView(recipe: Recipe.sampleRecipes[0])
}
