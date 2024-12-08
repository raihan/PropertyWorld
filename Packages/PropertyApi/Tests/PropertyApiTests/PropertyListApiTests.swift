//
//  PropertyListApiTests.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/5/24.
//

import Foundation
import Testing
import ApiService
@testable import PropertyApi
@testable import Models

struct PropertyListApiTests {
    let apiService = ApiServiceMock()
    let propertyList = PropertyList(properties: [.mockProperty])

    @Test
    func fetchPropertyListWhenSucceeds() async throws {
        // Given
        apiService.sendReturnedValue = propertyList
        let subject = PropertyListApi(apiService: apiService)

        // When
        let fetchedPropertyList = try await subject.propertyList()

        // Then
        #expect(fetchedPropertyList == propertyList)
    }

    @Test
    func fetchPropertyListWhenFails() async throws {
        // Given
        apiService.sendReturnedValue = nil
        let subject = PropertyListApi(apiService: apiService)

        // Then
        await #expect(throws: ApiError.self) {
            // When
            _ = try await subject.propertyList()
        }
    }
}
