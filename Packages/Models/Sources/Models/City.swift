//
//  City.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct City: Decodable, Sendable, Equatable {
    public let id: String
    public let name: String
    public let country: String
    public let idCountry: String
}
