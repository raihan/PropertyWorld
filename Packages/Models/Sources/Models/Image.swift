//
//  Image.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct PropertyImage: Decodable, Sendable, Hashable {
    public let suffix: String
    public let prefix: String
}

extension PropertyImage {
    public var imageUrl: URL? {
        URL(string: prefix + suffix)
    }
}
