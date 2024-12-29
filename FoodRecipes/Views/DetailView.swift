//
//  DetailView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import SwiftUI

struct DetailView: View {
    
    let recipe: Recipe
    @State var execute = false
    @StateObject var loremIpsum = APILoremIpsumViewModel()
    
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
                    HStack {
                        VStack(alignment: .leading) {
                            Text(recipe.description)
                                .multilineTextAlignment(.leading)
                            Text(loremIpsum.text)
                            Text(loremIpsum.error)
                            Button("Create lorem") {
                                loremIpsum.text = ""
                                loremIpsum.error = ""
                                print("Click \(execute)")
                                execute.toggle()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle(recipe.title)
        }
        .task {
            print("Task \(execute)")
            if execute {
                await loremIpsum.getText(paragraphs: Int.random(in: 1...2))
            }
        }
        .onChange(of: execute) { oldValue, newValue in
            Task {
                if execute {
                    await loremIpsum.getText(paragraphs: Int.random(in: 1...2))
                }
            }
        }
    }
}

#Preview {
    DetailView(recipe: Recipe.sampleRecipes[0])
}
