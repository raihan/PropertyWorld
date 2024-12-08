//
//  ApiService.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

final public class ApiService: ApiServiceProtocol {
    let session: URLSession

    public init(configuration: URLSessionConfiguration = .default) {
        session = URLSession(configuration: configuration)
    }

    public func send<T: Decodable & Sendable>(
        _ routeRequest: Request,
        _ responseType: T.Type
    ) async throws (ApiError) -> T {
        let (data, _) = try await send(request: routeRequest)
        return try decodeResponse(responseType, data: data)
    }

    private func send(
        request: Request,
        jsonDecoder: JSONDecoder = JSONDecoder()
    ) async throws (ApiError) -> (Data, StatusCode) {
        do {
            let (data, response) = try await session.data(for: request.asUrlRequest())

            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }

            let statusCode = httpResponse.statusCode

            // Success case
            return (data, statusCode)

        } catch let error as ApiError {
            // ApiError is thrown directly
            throw error
        } catch {
            // Other errors are wrapped in ApiError.requestFailure
            throw .requestFailure(error)
        }
    }

    private func decodeResponse<T: Decodable>(
        _ responseType: T.Type,
        data: Data
    ) throws (ApiError) -> T {
        do {
            return try JSONDecoder().decode(responseType, from: data)
        } catch let error {
            throw .decodeFailed(error)
        }
    }
}

extension String {
    static var baseUrl: String {
        "https://private-anon-f41bd10874-practical3.apiary-mock.com"
    }
}
