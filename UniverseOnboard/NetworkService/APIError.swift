//
//  APIError.swift
//  UniverseOnboard
//
//  Created by Никита Савенко on 02.12.2024.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case httpError(statusCode: Int)
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .noData:
            return "No data was received from the server."
        case .decodingError:
            return "Failed to decode the response."
        case .httpError(let statusCode):
            return "HTTP error with status code: \(statusCode)."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
