//
//  PropertyListViewModel.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import Observation
import PropertyApi
import Models

@Observable
public final class PropertyListViewModel {
    var state: LoadingState = .idle
    private let propertyListApi: PropertyListApiProtocol

    public init(propertyListApi: PropertyListApiProtocol = PropertyListApi()) {
        self.propertyListApi = propertyListApi
    }

    func fetchPropertyList() async {
        state = .loading

        do {
            let propertyList = try await propertyListApi.propertyList()
            state = .loaded(propertyList)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}

extension PropertyListViewModel {
    enum LoadingState {
        case idle
        case loading
        case loaded(PropertyList)
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
