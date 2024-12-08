//
//  OverallRating.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct OverallRating: Decodable, Sendable, Equatable {
    public let overall: Int?
    public let numberOfRatings: Int
}
