//
//  Rating.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct Rating: Decodable, Sendable, Equatable {
    public let overall: Int
    public let atmosphere: Int
    public let cleanliness: Int
    public let facilities: Int
    public let staff: Int
    public let security: Int
    public let location: Int
    public let valueForMoney: Int
}
