//
//  PropertyApiRequests.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import Foundation
import ApiService

extension String {
    static var cityId: String {
        return "1530"
    }

    static func propertyListPath(id: String) -> String {
        String(format: "/cities/%@/properties/", id)
    }

    static func propertyDetailsPath(id: String) -> String {
        String(format: "/properties/%@", id)
    }
}

//// MARK: - Endpoints
extension Request {
    static var propertyList: Request {
        Request(path: .propertyListPath(id: .cityId))
    }

    static func propertyDetails(id: String) -> Request {
        Request(path: .propertyDetailsPath(id: id))
    }
}
