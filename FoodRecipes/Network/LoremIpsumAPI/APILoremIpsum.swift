//
//  APILoremIpsum.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import Foundation

final class APILoremIpsum {
    
    public static func getText(paragraphs: Int) async throws -> FRLoremIpsum {
        let xApiKey = X_API_KEY
        guard let url = URL(string: "https://api.api-ninjas.com/v1/loremipsum?paragraphs=\(paragraphs)") else {
            throw FRError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(xApiKey, forHTTPHeaderField: "x-api-key")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FRError.invalidResponse
        }
        
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(FRLoremIpsum.self, from: data)
        } catch {
            throw FRError.invalidData
        }
        
    }
}

struct FRLoremIpsum: Codable, Equatable {
    let text: String
}
