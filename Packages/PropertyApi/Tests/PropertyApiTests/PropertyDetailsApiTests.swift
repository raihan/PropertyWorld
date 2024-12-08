//
//  PropertyDetailsApiTests.swift
//  PropertyApi
//
//  Created by Abdullah Muhammad Zubair on 12/6/24.
//

import Foundation
import Testing
import ApiService
@testable import PropertyApi
@testable import Models

struct PropertyDetailsApiTests {
    let apiService = ApiServiceMock()
    let propertyDetails: PropertyDetails = .mockPropertyDetails

    @Test
    func fetchPropertyDetailsWhenSucceeds() async throws {
        // Given
        apiService.sendReturnedValue = propertyDetails
        let subject = PropertyDetailsApi(apiService: apiService)

        // When
        let fetchedPropertyDetails = try await subject.propertyDetails(id: "123")

        // Then
        #expect(fetchedPropertyDetails == propertyDetails)
    }

    @Test
    func fetchPropertyDetailsWhenFails() async throws {
        // Given
        apiService.sendReturnedValue = nil
        let subject = PropertyDetailsApi(apiService: apiService)

        // Then
        await #expect(throws: ApiError.self) {
            // When
            _ = try await subject.propertyDetails(id: "123")
        }
    }
}
