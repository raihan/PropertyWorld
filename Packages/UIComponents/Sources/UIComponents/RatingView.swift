//
//  RatingView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI

public struct RatingView: View {
    let rating: Int
    let totalRating: Int

    public init(rating: Int, totalRating: Int) {
        self.rating = rating
        self.totalRating = totalRating
    }

    public var body: some View {
        HStack {
            Image(systemName: .ratingImage)
                .foregroundStyle(.yellow)

            Text(formattedRating)
            .font(.headline)

            Text(formattedRatingSummary)
            .font(.subheadline)
            .foregroundStyle(Color(uiColor: .darkGray))

            Spacer()
        }
        .frame(alignment: .leading)
    }

    private var formattedRating: String {
        String(format: "%.1f",  Double(rating) / 10.0)
    }

    private var formattedRatingSummary: String {
        String(format: "%@ (%d reviews)", rating.ratingSummary, totalRating)
    }
}

private extension Int {
    var ratingSummary: String {
        switch self {
        case 90...100:
            "SUPEREB"
        case 80...90:
            "FABULOUS"
        case 70...80:
            "VERY GOOD"
        case 60...70:
            "GOOD"
        default:
            ""
        }
    }
}

private extension String {
    static let ratingImage = "star.fill"
}

#Preview {
    RatingView(rating: 80, totalRating: 400)
        .padding()
        .background(Color(uiColor: .systemGray6))
}
