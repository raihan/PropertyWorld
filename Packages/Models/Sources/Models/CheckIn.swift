//
//  CheckIn.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public struct CheckIn: Decodable, Sendable, Equatable {
    public var startsAt: CheckInTime?
    public var endsAt: CheckInTime?

    enum CodingKeys: String, CodingKey {
        case startsAt, endsAt
    }

    public init(startsAt: CheckInTime?, endsAt: CheckInTime?) {
        self.startsAt = startsAt
        self.endsAt = endsAt
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        /// On the property details API, we found that startsAt & endsAt data are not consistant, sometimes they are `String` and sometimes they are `Int`. That't why we have added custom decoding here.
        /// Decoding startsAt
        if let value = try? container.decode(Int.self, forKey: .startsAt) {
            self.startsAt = .int(value)
        } else if let value = try? container.decode(String.self, forKey: .startsAt) {
            self.startsAt = .string(value)
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unable to decode value for `startsAt`")
            throw DecodingError.typeMismatch(CheckInTime.self, context)
        }

        /// Decoding endsAt
        if let value = try? container.decode(Int.self, forKey: .endsAt) {
            self.endsAt = .int(value)
        } else if let value = try? container.decode(String.self, forKey: .endsAt) {
            self.endsAt = .string(value)
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unable to decode value for `endsAt`")
            throw DecodingError.typeMismatch(CheckInTime.self, context)
        }
    }
}

public enum CheckInTime: Decodable, Sendable, Equatable {
    case int(Int)
    case string(String)

    public var asString: String? {
        switch self {
        case .int(let value):
            return "\(value)"
        case .string(let value):
            return value
        }
    }

    public static func == (lhs: CheckInTime, rhs: CheckInTime) -> Bool {
        switch (lhs, rhs) {
        case let (.int(lhsValue), .int(rhsValue)):
            return lhsValue == rhsValue
        case let (.string(lhsValue), .string(rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
