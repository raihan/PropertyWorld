//
//  PropertyDetailsViewModelTests.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/5/24.
//

import Foundation
import Testing
@testable import ApiService
@testable import PropertyWorld
@testable import Models

@Suite
struct PropertyDetailsViewModelTests {
    let propertyDetails: PropertyDetails = .propertyDetails

    @Test
    func initialState() async throws {
        // Given
        let subject = PropertyDetailsViewModel(proprtyId: "123")

        // When (app launches)

        // Then
        #expect(subject.state == .idle)
    }

    @Test
    func fetchWhenSucceeds() async throws {
        // Given
        let propertyDetailsApiMock = PropertyDetailsApiMock(propertyDetails: propertyDetails)
        let subject = PropertyDetailsViewModel(proprtyId: "123", propertyDetailsApi: propertyDetailsApiMock)

        // When
        await subject.fetchPropertyDetails()

        // Then
        if case .loaded(let loadedPropertyDetails) = subject.state {
            #expect(loadedPropertyDetails == propertyDetails)
            #expect(loadedPropertyDetails.name == propertyDetails.name)
        }
    }

    @Test
    func fetchWhenFails() async {
        // Given
        let propertyListApiMock = PropertyListApiMock(
            apiError:
                NSError(
                    domain: "domain",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey: "some error"]))

        let subject = PropertyListViewModel(propertyListApi: propertyListApiMock)

        // When
        await subject.fetchPropertyList()

        // Then
        if case .failed(let errorMessage) = subject.state {
            #expect(errorMessage == "some error")
        }
    }
}
