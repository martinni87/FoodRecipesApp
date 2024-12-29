//
//  FRDatabaseViewModel.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 21/12/24.
//

import SwiftUI

@MainActor
final class NetworkViewModel: ObservableObject {
    
    @Published var phrasesSets: [String: PhraseSet] = [:]
    @Published var usersSets: [String: UserData] = [:]
    @Published var dataSent: Bool = false
    @Published var error: String = ""
    @Published var hasError: Bool = false
    
    init() {}
    
    public func fetchPhrasesData() async {
        let result = await NetworkRepository.fetchPhrasesData()
        
        switch result {
        case .success(let data):
            self.phrasesSets = data
            self.error = ""
            self.hasError = false
        case .failure(let error):
            self.phrasesSets = [:]
            self.hasError = true
            self.error = error.rawValue
        }
    }
    
    public func patchPhrasesData(with data: [String: PhraseSet]) async {
        let result = await NetworkRepository.patchPhrasesData(with: data)
        
        switch result {
        case .success(let validation):
            self.dataSent = validation
            self.error = ""
            self.hasError = false
        case .failure(let error):
            self.dataSent = false
            self.hasError = true
            self.error = error.rawValue
        }
    }
    
    public func fetchUsersData() async {
        let result = await NetworkRepository.fetchUsersData()
        
        switch result {
        case .success(let data):
            self.usersSets = data
            self.error = ""
            self.hasError = false
        case .failure(let error):
            self.phrasesSets = [:]
            self.hasError = true
            self.error = error.rawValue
        }
    }
    
    public func patchUsersData(with data: [String: UserData]) async {
        let result = await NetworkRepository.patchUsersData(with: data)
        
        switch result {
        case .success(let validation):
            self.dataSent = validation
            self.error = ""
            self.hasError = false
        case .failure(let error):
            self.dataSent = false
            self.hasError = true
            self.error = error.rawValue
        }
    }
    
    public func resetPhrasesData() {
        phrasesSets = [:]
        dataSent = false
        error = ""
        hasError = false
    }
    
    public func resetUsersData() {
        usersSets = [:]
        dataSent = false
        error = ""
        hasError = false
    }
    
    public func resetAllData() {
        phrasesSets = [:]
        usersSets = [:]
        dataSent = false
        error = ""
        hasError = false
    }
}
