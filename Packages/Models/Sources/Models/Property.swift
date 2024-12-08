//
//  Property.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct Property: Decodable, Sendable, Equatable {
    public let id: String
    public let name: String
    public let city: City
    public let latitude: String
    public let longitude: String
    public let type: String
    public let images: [PropertyImage]
    public let overallRating: OverallRating
}
