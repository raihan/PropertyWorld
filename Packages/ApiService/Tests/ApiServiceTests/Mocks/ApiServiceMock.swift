//
//  ApiServiceMock.swift
//  ApiService
//
//  Created by Abdullah Muhammad Zubair on 12/5/24.
//

import Foundation
@testable import ApiService
@testable import Models

final class ApiServiceMock: ApiServiceProtocol {
    var sendReturnedValue: Any?

    func send<T: Decodable & Sendable>(
        _ routeRequest: Request,
        _ responseType: T.Type
    ) async throws (ApiError) -> T {
        if let value = (sendReturnedValue as? T) {
            return value
        }

        throw ApiError.invalidUrl
    }
}
