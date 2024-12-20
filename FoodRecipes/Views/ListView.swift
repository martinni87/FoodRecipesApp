//
//  ListView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import SwiftUI

struct ListView: View {
    
    let recipes: [Recipe]
    
    @Binding var numberOfColumns: Int
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var oneColumn: [GridItem] = Array(
        repeating: GridItem(.flexible()),
        count: 1)
    
    var variableColumns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: numberOfColumns)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if numberOfColumns == 0 {
                        LazyVGrid(columns: oneColumn, spacing: 20) {
                            ForEach(recipes) { recipe in
                                NavigationLink {
                                    DetailView(recipe: recipe)
                                } label: {
                                    CardTextComponent(recipe: recipe)
                                        .background {
                                            CardImageComponent(recipe: recipe)
                                                .scaledToFill()
                                                .frame(height: 100)
                                                .clipped()
                                        }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    } else {
                        LazyVGrid(columns: variableColumns, spacing: 20) {
                            ForEach(recipes) { recipe in
                                if numberOfColumns == 1 {
                                    NavigationLink {
                                        DetailView(recipe: recipe)
                                    } label: {
                                        CardComponent(recipe: recipe,
                                                      numberOfColumns: numberOfColumns)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                } else if numberOfColumns > 1 {
                                    NavigationLink {
                                        DetailView(recipe: recipe)
                                    } label: {
                                        ZStack {
                                            CardImageComponent(recipe: recipe)
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                            VStack {
                                                Text(recipe.title).lineLimit(1)
                                                Text(recipe.hearts)
                                            }
                                            .frame(width: 150)
                                            .padding(.vertical)
                                            .background(.white.opacity(0.75), in: RoundedRectangle(cornerRadius: 5))
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Recipes")
            .toolbar(removing: .title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        ToolBarGridButtonComponent(value: $numberOfColumns, size: .list)
                        if verticalSizeClass == .regular {
                            ToolBarGridButtonComponent(value: $numberOfColumns, size: .one)
                        }
                        ToolBarGridButtonComponent(value: $numberOfColumns, size: .two)
                        #if os(macOS)
                        ToolBarGridButtonComponent(value: $numberOfColumns, size: .three)
                        #endif
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var number = 0
    NavigationStack {
        TabView {
            Tab {
                ListView(recipes: Recipe.sampleRecipes, numberOfColumns: $number)
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
