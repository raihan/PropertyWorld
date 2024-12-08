//
//  PropertyListApiMock.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/5/24.
//

import Foundation
@testable import ApiService
@testable import PropertyApi
@testable import Models

class PropertyListApiMock: PropertyListApiProtocol {
    let propertyList: PropertyList?
    let apiError: Error?

    init(propertyList: PropertyList? = nil, apiError: Error? = nil) {
        self.propertyList = propertyList
        self.apiError = apiError
    }

    func propertyList() async throws -> PropertyList {
        if let apiError {
            throw apiError
        }

        guard let propertyList else {
            return PropertyList(properties: [])
        }
        
        return propertyList
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
