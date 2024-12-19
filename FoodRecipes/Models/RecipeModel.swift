//
//  RecipeModel.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 17/12/24.
//

import Foundation

enum MessurementUnit: String {
    case grame = "g."
    case kilograme = "kg."
    case milliliter = "ml."
    case liter = "l."
    case unit = "ud."
    case spoon = "spoon"
    case coffeeCup = "coffee cup"
    
    var value: String {
        return self.rawValue
    }
}

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let quantity: Int
    let unit: MessurementUnit
}

extension Ingredient {
    static let sampleIngredients = [
        Ingredient(name: "Milk", quantity: 250, unit: .milliliter),
        Ingredient(name: "Eggs", quantity: 2, unit: .unit),
        Ingredient(name: "Flour", quantity: 250, unit: .grame),
        Ingredient(name: "Sugar", quantity: 100, unit: .grame)
    ]
}

struct Step: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
}

extension Step {
    static let sampleSteps = [
        Step(title: "Step One", description: "This is step one"),
        Step(title: "Step Two", description: "This is step two"),
        Step(title: "Step Three", description: "This is step three"),
        Step(title: "Step Four", description: "This is step four")
    ]
}

struct Recipe: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let imageResource: String
    let minPortion: Int
    let maxPortion: Int
    let preparationTimeInMinutes: Int
    let description: String
    let ingredients: [Ingredient]
    let steps: [Step]
}

extension Recipe {
    
    static var emptyRecipe = Recipe(title: "", imageResource: "", minPortion: 0, maxPortion: 0, preparationTimeInMinutes: 0, description: "", ingredients: [], steps: [])
    
    static let sampleRecipe = Recipe(title: "Sample recipe",
                                     imageResource: "sampleImage1",
                                     minPortion: 4,
                                     maxPortion: 5,
                                     preparationTimeInMinutes: 30,
                                     description: loremIpsum.extractSubstring(start: 0, length: 350),
                                     ingredients: Ingredient.sampleIngredients,
                                     steps: Step.sampleSteps)
    
    static let sampleRecipesList = [
        Recipe(title: "Sample recipe 1",
                                     imageResource: "sampleImage1",
                                     minPortion: 4,
                                     maxPortion: 5,
                                     preparationTimeInMinutes: 30,
                                     description: loremIpsum.extractSubstring(start: 0, length: 350),
                                     ingredients: Ingredient.sampleIngredients,
                                     steps: Step.sampleSteps),
        Recipe(title: "Sample recipe 2",
                                     imageResource: "sampleImage2",
                                     minPortion: 2,
                                     maxPortion: 3,
                                     preparationTimeInMinutes: 20,
                                     description: loremIpsum.extractSubstring(start: 0, length: 550),
                                     ingredients: Ingredient.sampleIngredients,
                                     steps: Step.sampleSteps),
        Recipe(title: "Sample recipe 3",
                                     imageResource: "sampleImage3",
                                     minPortion: 10,
                                     maxPortion: 12,
                                     preparationTimeInMinutes: 45,
                                     description: loremIpsum.extractSubstring(start: 0, length: 150),
                                     ingredients: Ingredient.sampleIngredients,
                                     steps: Step.sampleSteps)
        ]
}
