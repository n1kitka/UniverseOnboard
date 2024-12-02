//
//  OnboardingViewModel.swift
//  UniverseOnboard
//
//  Created by Никита Савенко on 02.12.2024.
//


class OnboardingViewModel {
    var onboardingItems: [OnboardingItem] = []
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchOnboardingData() {
        networkService.fetchOnboardingData { [weak self] result in
            switch result {
            case .success(let items):
                print("Fetched items: \(items)")
                self?.onboardingItems = items
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
