//
//  PropertyDetailsApi.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import ApiService
import Models

public protocol PropertyDetailsApiProtocol {
    func propertyDetails(id: String) async throws -> PropertyDetails
}

public final class PropertyDetailsApi: PropertyDetailsApiProtocol {
    let apiService: ApiServiceProtocol

    public init(apiService: ApiServiceProtocol = ApiService()) {
        self.apiService = apiService
    }

    public func propertyDetails(id: String) async throws(Error) -> PropertyDetails {
        return try await apiService.send(.propertyDetails(id: id), PropertyDetails.self)
    }
}
