//
//  PropertyListApi.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import Foundation
import ApiService
import Models

public protocol PropertyListApiProtocol {
    func propertyList() async throws -> PropertyList
}

public final class PropertyListApi: PropertyListApiProtocol {
    let apiService: ApiServiceProtocol

    public init(apiService: ApiServiceProtocol = ApiService()) {
        self.apiService = apiService
    }

    public func propertyList() async throws(ApiError) -> PropertyList {
        return try await apiService.send(.propertyList, PropertyList.self)
    }
}
