//
//  CheckInView.swift
//  UIComponents
//
//  Created by Abdullah Muhammad Zubair on 12/6/24.
//

import SwiftUI

public struct CheckInView: View {
    let checkInStartTime: String
    let checkInEndTime: String

    public init(checkInStartTime: String, checkInEndTime: String) {
        self.checkInStartTime = checkInStartTime
        self.checkInEndTime = checkInEndTime
    }

    public var body: some View {
        HStack {
            CheckInItem(
                image: .checkInImageName,
                imageColor: .green,
                title: .checkIn,
                details: formattedCheckInTime)
            .padding(.leading, 25)

            Spacer()

            CheckInItem(
                image: .checkOutImageName,
                imageColor: .red,
                title: .checkOut,
                details: .formattedCheckOutTime)
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(5)
    }

    private var formattedCheckInTime: String {
        String(
            format: "%@ - %@",
            checkInStartTime.formatCheckInTime,
            checkInEndTime.formatCheckInTime)
    }
}

private extension String {
    var formatCheckInTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"

        let date = formatter.date(from: self) ?? Date()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }

    static let formattedCheckOutTime = "11:00 AM"
    static let checkIn = "Check In"
    static let checkOut = "Check Out"
    static let checkInImageName = "arrow.right.to.line.square"
    static let checkOutImageName = "arrow.backward.to.line.square"
}

struct CheckInItem: View {
    let image: String
    let imageColor: Color
    let title: String
    let details: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundStyle(imageColor)
                .scaleEffect(2.5)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))

                Text(details)
                .font(.system(size: 14))
            }
            .padding(10)
        }
    }
}

#Preview {
    CheckInView(checkInStartTime: "14", checkInEndTime: "17")
        .frame(maxWidth: .infinity)
}
