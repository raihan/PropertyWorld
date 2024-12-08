//
//  PropertyDetailsApiMock.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/5/24.
//

import Foundation
@testable import ApiService
@testable import PropertyApi
@testable import Models

class PropertyDetailsApiMock: PropertyDetailsApiProtocol {
    let propertyDetails: PropertyDetails?
    let apiError: Error?

    init(propertyDetails: PropertyDetails? = nil, apiError: Error? = nil) {
        self.propertyDetails = propertyDetails
        self.apiError = apiError
    }

    func propertyDetails(id: String) async throws -> PropertyDetails {
        if let apiError {
            throw apiError
        }

        guard let propertyDetails else {
            return .propertyDetails
        }

        return propertyDetails
    }
}

public extension PropertyDetails {
    static let propertyDetails = PropertyDetails(
        id: "123",
        name: "STF",
        rating: Rating(
            overall: 80,
            atmosphere: 80,
            cleanliness: 80,
            facilities: 80,
            staff: 80,
            security: 80,
            location: 80,
            valueForMoney: 80),
        description: "DEF",
        latitude: "10.11",
        longitude: "10.11",
        address1: "abcd",
        address2: "",
        directions: "abcd",
        city: City(id: "1", name: "abc", country: "def", idCountry: "123"),
        paymentMethods: ["abc"],
        policies: ["abc"],
        totalRatings: "300",
        images: [PropertyImage(suffix: "acd", prefix: "def")],
        type: "bcd",
        depositPercentage: 55,
        associations: ["xyz"],
        checkIn: CheckIn(
            startsAt: CheckInTime.string("12"),
            endsAt: CheckInTime.string("14")))
}
