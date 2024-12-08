//
//  PropertyList.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import Foundation

public struct PropertyList: Decodable, Sendable, Equatable {
    public let properties: [Property]
}
