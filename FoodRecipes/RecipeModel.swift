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

struct Ingredient {
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

struct Step {
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

struct Recipe {
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
    
    static let emptyRecipe = Recipe(title: "", imageResource: "", minPortion: 0, maxPortion: 0, preparationTimeInMinutes: 0, description: "", ingredients: [], steps: [])
    
    static let sampleRecipe = Recipe(title: "Sample recipe",
                                     imageResource: "sampleImage",
                                     minPortion: 4,
                                     maxPortion: 5,
                                     preparationTimeInMinutes: 30,
                                     description: loremIpsum.extractSubstring(start: 0, length: 350),
                                     ingredients: Ingredient.sampleIngredients,
                                     steps: Step.sampleSteps)
}
