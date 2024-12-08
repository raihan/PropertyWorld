//
//  ContentView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import SwiftUI
import Models
import UIComponents

struct PropertyListView: View {
    @State var viewModel: PropertyListViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView()

                case .loaded(let propertyList):
                    propertyListView(propertyList: propertyList)

                case .failed(let errorMessage):
                    ErrorView(message: errorMessage) {
                        Task { await viewModel.fetchPropertyList() }
                    }
                }
            }
            .navigationTitle(.tite)
            .onViewDidLoad {
                Task {
                    await viewModel.fetchPropertyList()
                }
            }
        }
    }
}

private func propertyListView(propertyList: PropertyList) -> some View {
    ScrollView(showsIndicators: false) {
        LazyVStack {
            ForEach(propertyList.properties, id: \.id) { property in
                NavigationLink {
                    let viewModel = PropertyDetailsViewModel(proprtyId: property.id)
                    PropertyDetailsView(viewModel: viewModel)
                } label: {
                    PropertyItemView(viewModel: property.propertyItemViewModel)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

private extension Text {
    static let tite: Text = .init("Property World")
}

private extension Property {
    var propertyItemViewModel: PropertyItemViewModel {
        PropertyItemViewModel(
            name: name,
            type: type,
            city: city.name,
            county: city.country,
            images: images.map { $0.imageUrl },
            rating: overallRating.overall,
            totalRating: overallRating.numberOfRatings)
    }
}

#Preview {
    PropertyListView(viewModel: PropertyListViewModel())
}
