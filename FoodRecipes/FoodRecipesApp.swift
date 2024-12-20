//
//  FoodRecipesApp.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 17/12/24.
//

import SwiftUI
import SwiftData

@main
struct FoodRecipesApp: App {
    
    private var recipes = Recipe.sampleRecipes
    @State private var numberOfColumns = 0
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabView {
                    Tab {
                        ListView(recipes: recipes, numberOfColumns: $numberOfColumns)
//                            .background(Color.mint.opacity(0.2))
                    } label: {
                        Label("Home", systemImage: "house")
                    }
                    Tab {
                        Text("Favorites page")
                    } label: {
                        Label("Favorites", systemImage: "heart")
                    }
                    Tab {
                        Text("Settings page")
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Label("My cookpad", systemImage: "carrot")
                            .foregroundStyle(.accent)
                            .labelStyle(.titleAndIcon)
                            .font(.title3)
                            .fontWeight(.black)
                            .fontDesign(.serif)
                    }
                }
            }
            
        }
    }
}
