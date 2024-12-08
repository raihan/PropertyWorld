//
//  PropertyDetails.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct PropertyDetails: Decodable, Sendable, Equatable {
    public let id: String
    public let name: String
    public let rating: Rating?
    public let description: String
    public let latitude: String
    public let longitude: String
    public let address1: String
    public let address2: String
    public let directions: String
    public let city: City
    public let paymentMethods: [String]
    public let policies: [String]
    public let totalRatings: String
    public let images: [PropertyImage]
    public let type: String
    public let depositPercentage: Int
    public let associations: [String]
    public let checkIn: CheckIn?
}
