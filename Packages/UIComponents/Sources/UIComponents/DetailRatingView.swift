//
//  DetailRatingView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI

public struct DetailRatingViewModel {
    let header: String
    let rating: Int
    let totalRating: Int
    let ratingInfo: [(String, Int)]

    public init(header: String, rating: Int, totalRating: Int, ratingInfo: [(String, Int)]) {
        self.header = header
        self.rating = rating
        self.totalRating = totalRating
        self.ratingInfo = ratingInfo
    }
}

public struct DetailRatingView: View {
    let viewModel: DetailRatingViewModel

    public init(viewModel: DetailRatingViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.header)
                .font(.headline)
                .padding(.bottom, 8)

            RatingView(rating: viewModel.rating, totalRating: viewModel.totalRating)
                .padding(.bottom)

            ForEach(viewModel.ratingInfo, id: \.0) { item in
                RatingProgressView(name: item.0, value: item.1)
            }
        }
        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(5)
    }
}

#Preview {
    let viewModel = DetailRatingViewModel(
        header: "Reviews",
        rating: 9,
        totalRating: 400,
        ratingInfo: [
            ("Value for money", 80),
            ("Security", 80),
            ("Atmosphere", 80),
            ("Cleanliness", 80),
            ("Staff", 80),
            ("Location", 80),
            ("Facilities", 80)
        ]
    )

    DetailRatingView(viewModel: viewModel)
}
