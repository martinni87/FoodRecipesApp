//
//  NetworkDataSource.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 20/12/24.
//

import Foundation

protocol FetchableData: Codable, Equatable {}

struct PhraseSet: FetchableData, Identifiable {
    let id: String
    let author: String
    let phrase: String
}

struct UserData: FetchableData, Identifiable {
    let id: String
    let name: String
}

struct RecipeData: FetchableData, Identifiable {
    let id: String
    let title: String
    let description: String
    let ingredients: [String]
    let steps: [String]
    
}

enum Endpoint: String {
    case phraseSets = "phrasesData.json"
    case userData = "usersData.json"
    case recipesData = "recipesData.json"
    
    var path: String {
        return self.rawValue
    }
}

enum NetworkError: String, Error {
    case badURL = "Bad URL"
    case badResponse = "Bad Response"
    case badEncoding = "Bad encoding"
    case badDecoding = "Bad decoding"
    case unknown = "Unknown"
}

struct NetworkDataSource {
    private static let baseUrl = "https://foodrecipes-56164-default-rtdb.europe-west1.firebasedatabase.app/"
    
    public static func fetchData<T: FetchableData>(from endpoint: Endpoint) async throws -> [String: T] {
        guard let url = URL(string: baseUrl + endpoint.path) else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        do {
            let jsonDecoder = JSONDecoder()
            let decodedData = try jsonDecoder.decode([String: T].self, from: data)
            return decodedData
        } catch {
            throw NetworkError.badDecoding
        }
    }
    
    public static func patchData<T: FetchableData>(to endpoint: Endpoint, with data: [String: T]) async throws -> [String: T] {
        guard let url = URL(string: baseUrl + endpoint.path) else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        jsonEncoder.outputFormatting = .sortedKeys
        
        guard let encodedData = try? jsonEncoder.encode(data) else {
            throw NetworkError.badEncoding
        }
        request.httpBody = encodedData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        do {
            let jsonDecoder = JSONDecoder()
            let decodedData = try jsonDecoder.decode([String: T].self, from: data)
            return decodedData
        } catch {
            throw NetworkError.badDecoding
        }
    }
}
