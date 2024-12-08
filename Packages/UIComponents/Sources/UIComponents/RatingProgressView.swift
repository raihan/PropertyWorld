//
//  RatingProgressView.swift
//  UIComponents
//
//  Created by Abdullah Muhammad Zubair on 12/7/24.
//

import SwiftUI

struct RatingProgressView: View {
    let name: String
    let value: Int

    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }

    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 14))
                .frame(width: 120, alignment: .leading)

            ProgressView(value: Float(value), total: 100)
                .frame(height: 8.0)
                .scaleEffect(x: 1, y: 2, anchor: .center)
                .clipShape(RoundedRectangle(cornerRadius: 6))

            Text(formattedRating)
                .font(.system(size: 14, weight: .semibold))
                .frame(width: 50)
        }
        .tint(.yellow)
    }

    private var formattedRating: String {
        String(format: "%.1f", (Float(value) / 10.0))
    }
}

#Preview {
    RatingProgressView(name: "Value for money", value: 80)
        .padding()
        .background(Color(uiColor: .systemGray6))
}
