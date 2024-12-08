//
//  PropertyItemSummaryView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI

public struct PropertySummaryViewModel {
    let name: String
    let type: String
    let address: String
    let rating: Int?
    let totalRating: Int?

    public init(name: String, type: String, address: String, rating: Int? = nil, totalRating: Int? = nil) {
        self.name = name
        self.type = type
        self.address = address
        self.rating = rating
        self.totalRating = totalRating
    }
}

public struct PropertySummaryView: View {
    let viewModel: PropertySummaryViewModel

    public init(viewModel: PropertySummaryViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.type.capitalized)
                    .font(.system(size: 14))

                Text(viewModel.name)
                    .font(.headline)

                Text(viewModel.address)
                    .font(.subheadline)

                if let rating = viewModel.rating,
                   let totalRating = viewModel.totalRating {
                    RatingView(rating: rating, totalRating: totalRating)
                }
            }
            .padding(8)

            Spacer()
        }
    }
}

#Preview {
    let viewModel =  PropertySummaryViewModel(
        name: "STF Vandrarhem Stigbergsliden",
        type: "HOSTEL",
        address: "Stigbergsliden 10",
        rating: 80,
        totalRating: 400
    )

    PropertySummaryView(viewModel: viewModel)
        .padding()
        .background(Color(uiColor: .systemGray6))
}
