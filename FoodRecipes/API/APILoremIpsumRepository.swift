//
//  APILoremIpsumRepository.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 21/12/24.
//

import Foundation

final class APILoremIpsumRepository {
    
    public static func getText(paragraphs: Int) async -> Result<String, FRError> {
        do {
            let text = try await APILoremIpsum.getText(paragraphs: paragraphs).text
            return .success(text)
        } catch let caughtError as FRError {
            return .failure(caughtError)
        } catch {
            return .failure(FRError.unknownError)
        }
    }
}
