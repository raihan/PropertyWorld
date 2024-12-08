//
//  ApiError.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Foundation

public enum ApiError: Error {
    case invalidUrl
    case invalidResponse
    case statusCode(Int)
    case decodeFailed(Error)
    case requestFailure(Error)
    case other(Error)
}
