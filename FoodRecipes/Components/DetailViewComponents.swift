//
//  DetailViewBodyComponent.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 18/12/24.
//

import SwiftUI

struct DetailViewHeaderComponent: View {
    let recipe: Recipe
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(recipe.imageResource)
                .resizable()
                .adaptiveScaling()
            DetailViewHeaderTitleComponent(recipe: recipe)
        }
    }
}

struct DetailViewHeaderTitleComponent: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            FRText(recipe.title)
                .font(.title)
                .bold()
                .padding()
            Spacer()
            VStack(alignment: .trailing) {
                HStack {
                    FRText("\(recipe.minPortion) - \(recipe.maxPortion)")
                    Image(systemName: "person.fill")
                }
                FRText("Time: \(recipe.preparationTimeInMinutes) min")
            }
            .padding()
        }
        .foregroundStyle(Color(uiColor: .systemBackground).opacity(0.8))
        .background(Color(uiColor: .label).opacity(0.5), in: Rectangle())
    }
}

#Preview("DetailView HeaderComponent") {
    DetailViewHeaderComponent(recipe: Recipe.sampleRecipe)
}

struct DetailViewBodyComponent: View {
    
    let recipe: Recipe
    @Binding var actionOneState: Bool
    
    var body: some View {
        ScrollView {
            Rectangle()
                .frame(height: 25)
                .foregroundStyle(.clear)
            FRText(recipe.description, spacing: 10, padding: 0)
                .fontWeight(.semibold)
            FRAvocadoHints("¡Elige entre ver el listado de ingredientes o comenzar ya a cocinar!")
                .padding(.vertical, 100)
            HStack {
                Spacer()
                FRButton(.secondary) {
                    actionOneState.toggle()
                } label: {
                    Label("Ingredientes", systemImage: "carrot")
                }
                Spacer()
                FRNavigationLink(.primary){
                    Text("Destination")
                } label: {
                    Text("Comenzar 🥑")
                }
                Spacer()
            }
            Rectangle()
                .frame(height: 50)
                .opacity(0)
        }
        .scrollIndicators(.never)
    }
    
}

#Preview("DetailView BodyComponent") {
    NavigationStack {
        DetailViewBodyComponent(recipe: Recipe.sampleRecipe, actionOneState: .constant(false))
            .navigationTitle(Recipe.sampleRecipe.title)
            .toolbar(.hidden)
    }
}
