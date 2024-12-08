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

public extension Property {
    static let mockProperty = Property(
        id: "1",
        name: "STF Vandrarhem Stigbergsliden",
        city:
            City(
                id: "1",
                name: "Gothenburg",
                country: "Sweden",
                idCountry: "1"),
        latitude: "12",
        longitude: "13",
        type: "HOSTEL",
        images:
            [
                PropertyImage(
                    suffix: ".jpg",
                    prefix: "https://u.hwstatic.com/propertyimages/3/32849/1"),

                PropertyImage(
                    suffix: ".jpg",
                    prefix: "https://u.hwstatic.com/propertyimages/3/32849/7")
            ],
        overallRating:
            OverallRating(
                overall: 10,
                numberOfRatings: 1000)
    )
}

public extension PropertyDetails {
    static let mockPropertyDetails = PropertyDetails(
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
        checkIn: CheckIn(startsAt: CheckInTime.string("12"), endsAt: CheckInTime.string("14")))
}
