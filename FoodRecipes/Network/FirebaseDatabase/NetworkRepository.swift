//
//  NetworkRepository.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 21/12/24.
//

import Foundation

struct NetworkRepository {
    
    public static func fetchPhrasesData() async -> Result<[String: PhraseSet], NetworkError> {
        do {
            let data: [String: PhraseSet] = try await NetworkDataSource.fetchData(from: .phraseSets)
            return .success(data)
        } catch let caughtError as NetworkError {
            return .failure(caughtError)
        } catch {
            return .failure(NetworkError.unknown)
        }
    }
    
    public static func patchPhrasesData(with data: [String: PhraseSet]) async -> Result<Bool, NetworkError> {
        do {
            let data: [String: PhraseSet] = try await NetworkDataSource.patchData(to: .phraseSets, with: data)
            return .success(!data.isEmpty)
        } catch let someError as NetworkError {
            return .failure(someError)
        } catch {
            return .failure(NetworkError.unknown)
        }
    }
    
    public static func fetchUsersData() async -> Result<[String: UserData], NetworkError> {
        do {
            let data: [String: UserData] = try await NetworkDataSource.fetchData(from: .userData)
            return .success(data)
        } catch let caughtError as NetworkError {
            return .failure(caughtError)
        } catch {
            return .failure(NetworkError.unknown)
        }
    }
    
    public static func patchUsersData(with data: [String: UserData]) async -> Result<Bool, NetworkError> {
        do {
            let data: [String: UserData] = try await NetworkDataSource.patchData(to: .userData, with: data)
            return .success(!data.isEmpty)
        } catch let someError as NetworkError {
            return .failure(someError)
        } catch {
            return .failure(NetworkError.unknown)
        }
    }
}
