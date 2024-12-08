//
//  PropertyListViewModelTests.swift
//  PropertyWorldTests
//
//  Created by Abdullah Muhammad Zubair on 12/5/24.
//

import Foundation
import Testing
@testable import ApiService
@testable import PropertyWorld
@testable import Models

@Suite
struct PropertyListViewModelTests {
    let propertyList = PropertyList(properties: [.mockProperty])

    @Test
    func initialState() async throws {
        // Given
        let subject = PropertyListViewModel()

        // When (app launches)

        // Then
        #expect(subject.state == .idle)
    }

    @Test
    func fetchWhenSucceeds() async throws {
        // Given
        let propertyListApiMock = PropertyListApiMock(propertyList: propertyList)
        let subject = PropertyListViewModel(propertyListApi: propertyListApiMock)

        // When
        await subject.fetchPropertyList()

        // Then
        if case .loaded(let loadedPropertyList) = subject.state {
            #expect(loadedPropertyList == propertyList)
            #expect(loadedPropertyList.properties.count > 0)
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
