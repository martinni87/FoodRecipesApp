//
//  APILoremIpsumViewModel.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 21/12/24.
//

import Foundation

@MainActor
final class APILoremIpsumViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var error: String = ""
    
    init() {}
    
    func getText(paragraphs: Int = 1) async {
        let result = await APILoremIpsumRepository.getText(paragraphs: paragraphs)
        
        switch result {
        case .success(let text):
            self.text = text
        case .failure(let error):
            self.error = error.rawValue
        }
    }
    
}
