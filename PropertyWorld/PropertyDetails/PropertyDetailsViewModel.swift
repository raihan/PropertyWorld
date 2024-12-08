//
//  PropertyDetailsViewModel.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import Observation
import PropertyApi
import Models

@Observable
public final class PropertyDetailsViewModel {
    var state: LoadingState = .idle
    private let proprtyId: String
    private let propertyDetailsApi: PropertyDetailsApiProtocol
    var title = ""

    public init(proprtyId: String, propertyDetailsApi: PropertyDetailsApiProtocol = PropertyDetailsApi()) {
        self.proprtyId = proprtyId
        self.propertyDetailsApi = propertyDetailsApi
    }

    func fetchPropertyDetails() async {
        state = .loading

        do {
            let propertyDetails = try await propertyDetailsApi.propertyDetails(id: proprtyId)
            state = .loaded(propertyDetails)
            title = propertyDetails.name
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}

extension PropertyDetailsViewModel {
    enum LoadingState {
        case idle
        case loading
        case loaded(PropertyDetails)
        case failed(String)

        static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
            switch (lhs, rhs) {
            case (.idle, .idle), (.loading, .loading):
                return true
            case (.loaded(let lhsData), .loaded(let rhsData)):
                return lhsData == rhsData
            case (.failed(let lhsError), .failed(let rhsError)):
                return lhsError == rhsError
            default:
                return false
            }
        }
    }
}
