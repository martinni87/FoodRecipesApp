//
//  FRError.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 21/12/24.
//

import Foundation

enum FRError: String, Error {
    case invalidURL = "Check URL format"
    case invalidResponse = "Something went wrong retrieving response"
    case invalidData = "Something went wrong decoding data"
    case unknownError = "Unknown error happened"
    case none
    
    var definition: String {
        return self.rawValue
    }
}
