//
//  ApiProtocol.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import SwiftUI

public protocol ApiServiceProtocol {
    func send<T: Decodable>(_ routeRequest: Request,_ responseType: T.Type) async throws (ApiError) -> T
}
