//
//  NetworkService.swift
//  UniverseOnboard
//
//  Created by Никита Савенко on 02.12.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchOnboardingData(completion: @escaping (Result<[OnboardingItem], Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    func fetchOnboardingData(completion: @escaping (Result<[OnboardingItem], Error>) -> ()) {
        guard let url = URL(string: "https://test-ios.universeapps.limited/onboarding") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check HTTP response status code
            if let httpResponse = response as? HTTPURLResponse {
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(APIError.httpError(statusCode: httpResponse.statusCode)))
                    return
                }
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(OnboardingResponse.self, from: data)
                completion(.success(response.items))
            } catch {
                completion(.failure(APIError.decodingError))
            }
        }.resume()
    }
}


