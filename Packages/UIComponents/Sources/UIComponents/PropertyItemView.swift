//
//  PropertyView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import SwiftUI

public struct PropertyItemViewModel {
    let name: String
    let type: String
    let city: String
    let county: String
    let images: [URL?]
    let rating: Int?
    let totalRating: Int?

    public init(name: String, type: String, city: String, county: String, images: [URL?], rating: Int?, totalRating: Int?) {
        self.name = name
        self.type = type
        self.city = city
        self.county = county
        self.images = images
        self.rating = rating
        self.totalRating = totalRating
    }
}

public struct PropertyItemView: View {
    let viewModel: PropertyItemViewModel

    public init(viewModel: PropertyItemViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            PropertyImageCarousel(images: viewModel.images)
            PropertySummaryView(viewModel: viewModel.propertySummaryViewModel)
        }
        .padding()
    }
}

#Preview {
    let viewModel = PropertyItemViewModel(
        name: "STF Vandrarhem Stigbergsliden",
        type: "HOSTEL",
        city: "Gothenburg",
        county: "Sweden",
        images: [
            URL(string: "https://ucd.hwstatic.com/propertyimages/3/32849/1.jpg"),
            URL(string: "https://ucd.hwstatic.com/propertyimages/3/32849/7.jpg")
                ],
        rating: 80,
        totalRating: 400)

    PropertyItemView(viewModel: viewModel)
        .frame(width: 400, height: 400)
}

private extension PropertyItemViewModel {
    var propertySummaryViewModel: PropertySummaryViewModel {
        PropertySummaryViewModel(
            name: name,
            type: type,
            address: shortAddress,
            rating: rating,
            totalRating: totalRating
        )
    }

    var shortAddress: String {
        String(format: "%@, %@", city, county)
    }
}
