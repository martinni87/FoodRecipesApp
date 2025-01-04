//
//  LocalDataSource.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import Foundation

struct LocalImageResources {
    static let sample1 = "sample1"
    static let sample2 = "sample2"
    static let sample3 = "sample3"
    static let sample4 = "sample4"
    static let sample5 = "sample5"
}

extension Recipe {
    
    static let emptyRecipe = Recipe(title: "", description: "", numberOfValues: 0, totalPointsGiven: 0, difficulty: .easy, preparationTimeInMinutes: 0, imageResource: "")
    
    static let sampleRecipes = [
        Recipe(title: "Sample recipe 1",
               description: "This is the sample recipe number 1. Enjoy cooking",
               numberOfValues: 150,
               totalPointsGiven: 330,
               difficulty: .easy,
               preparationTimeInMinutes: 10,
               imageResource: LocalImageResources.sample1),
        Recipe(title: "Sample recipe 2. A bit longer",
               description: "This is a very very long description about a recipe so we can test how the multiline behaves with this one. Is it doing good?",
               numberOfValues: 15,
               totalPointsGiven: 65,
               difficulty: .easy,
               preparationTimeInMinutes: 15,
               imageResource: LocalImageResources.sample2),
        Recipe(title: "Sample 3",
               description: "This is a very very long description about a recipe so we can test how the multiline behaves with this one. Is it doing good?",
               numberOfValues: 1,
               totalPointsGiven: 5,
               difficulty: .easy,
               preparationTimeInMinutes: 40,
               imageResource: LocalImageResources.sample3),
        Recipe(title: "Sample recipe 4. This one has a very much longer title",
               description: "Short description",
               numberOfValues: 2,
               totalPointsGiven: 9,
               difficulty: .easy,
               preparationTimeInMinutes: 20,
               imageResource: LocalImageResources.sample4),
        Recipe(title: "Sample recipe 5",
               description: "This is the sample recipe number 5",
               numberOfValues: 130,
               totalPointsGiven: 700,
               difficulty: .easy,
               preparationTimeInMinutes: 20,
               imageResource: LocalImageResources.sample5),
    ]
}
