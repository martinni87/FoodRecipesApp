//
//  RecipeModel.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import Foundation

enum Difficulty: String {
    case easy, normal, hard, chef
    
    var value: String {
        self.rawValue
    }
}

struct Recipe: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let numberOfValues: Int
    let totalPointsGiven: Int
    let difficulty: Difficulty
    let preparationTimeInMinutes: Int
    var maximumTimeExpected: Int {
        return preparationTimeInMinutes + 10
    }
    let imageResource: String
}

extension Recipe {
    var hearts: String {
        let averageScore = totalPointsGiven / numberOfValues
        var blankHearts = ""
        var filledHearts = ""
        let blankHeartsNumber = 5 - averageScore
        let filledHeartsNumber = averageScore
        
        blankHearts = String(repeating: "♡", count: blankHeartsNumber)
        filledHearts = String(repeating: "♥︎", count: filledHeartsNumber)

        return filledHearts + blankHearts
    }
}
