//
//  OnboardingResponse.swift
//  UniverseOnboard
//
//  Created by Никита Савенко on 02.12.2024.
//

struct OnboardingResponse: Codable {
    let items: [OnboardingItem]
}

struct OnboardingItem: Codable {
    let id: Int
    let question: String
    let answers: [String]
}
