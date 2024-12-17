//
//  RecipeDescriptionView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 17/12/24.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    @State var hasStarted: Bool = false
    
    var body: some View {
        ScrollView {
            DetailViewHeaderComponent(recipe: recipe)
            DetailViewBodyComponent(recipe: recipe)
                .fontWeight(.semibold)
            Button {
                hasStarted = true
            } label: {
                Label("Start cooking!", systemImage: "fork.knife")
            }
            .bold()
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $hasStarted) {
            Text("Above here show steps")
        }
    }
}

#Preview {
    NavigationStack{
        RecipeDetailView(recipe: Recipe.sampleRecipe)
    }
}


struct DetailViewHeaderComponent: View {
    let recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(recipe.imageResource)
                .resizable()
                .scaledToFit()
            HStack {
                Text(recipe.title)
                    .padding()
                    .font(.title)
                    .bold()
                Spacer()
                VStack(alignment: .trailing) {
                    HStack {
                        Text("\(recipe.minPortion) - \(recipe.maxPortion)")
                        Image(systemName: "person.fill")
                    }
                    Text("Time: \(recipe.preparationTimeInMinutes) min")
                }
                .padding()
            }
            .foregroundStyle(Color(uiColor: .systemBackground).opacity(0.8))
            .background(Color(uiColor: .label).opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
            .padding()
        }
        
    }
}

struct DetailViewBodyComponent: View {
    
    let recipe: Recipe
    
    var body: some View {
        Text(recipe.description)
            .padding()
            .multilineTextAlignment(.leading)
            .lineSpacing(10)
    }
}

#Preview {
    DetailViewBodyComponent(recipe: Recipe.sampleRecipe)
}

#Preview {
    DetailViewHeaderComponent(recipe: Recipe.sampleRecipe)
}
