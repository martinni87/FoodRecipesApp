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
            Text("After this point the app should start showing steps")
        }
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe.sampleRecipe)
}


struct DetailViewHeaderComponent: View {
    let recipe: Recipe
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(recipe.imageResource)
                .resizable()
                .adaptiveScaling()
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

struct AdaptiveScalingModifier: ViewModifier {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    func body(content: Content) -> some View {
        if verticalSizeClass == .regular {
            content
                .scaledToFit() // Landscape: scaleToFit
        } else {
            content
                .scaledToFill() // Portrait: scaleToFill
                .frame(height: 180)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
        }
    }
}

extension View {
    func adaptiveScaling() -> some View {
        self.modifier(AdaptiveScalingModifier())
    }
}

#Preview {
    DetailViewBodyComponent(recipe: Recipe.sampleRecipe)
}

#Preview {
    DetailViewHeaderComponent(recipe: Recipe.sampleRecipe)
}
