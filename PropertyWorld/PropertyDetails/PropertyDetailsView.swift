//
//  PropertyDetailsView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import SwiftUI
import Models
import UIComponents

struct PropertyDetailsView: View {
    @State var viewModel: PropertyDetailsViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView()

            case .loaded(let propertyDetails):
                propertyDetailsView(propertyDetails: propertyDetails)

            case .failed(let errorMessage):
                ErrorView(message: errorMessage) {
                    Task { await fetchDetails() }
                }
            }
        }
        .navigationTitle(viewModel.title)
        .task { await fetchDetails() }
    }

    private func fetchDetails() async {
        await viewModel.fetchPropertyDetails()
    }
}

private func propertyDetailsView(propertyDetails: PropertyDetails) -> some View {
    ScrollView(showsIndicators: false) {
        /// Property image carousel
        let images = propertyDetails.images.map({ $0.imageUrl })
        PropertyImageCarousel(images: images)

        /// Property summary which includes name, type, address and ratings
        let propertySummaryViewModel = propertyDetails.propertySummaryViewModel
        PropertySummaryView(viewModel: propertySummaryViewModel)

        /// Property policies
        PolicyView(policies: propertyDetails.policies)

        /// Property description
        let descriptionViewModel = ShortDescriptionViewModel(
            header: .description,
            details: propertyDetails.description)
        ShortDescriptionView(viewModel: descriptionViewModel)

        /// Ccheck in time
        if let startsAt = propertyDetails.startsAt,
           let endsAt = propertyDetails.endsAt {
            CheckInView(checkInStartTime: startsAt, checkInEndTime: endsAt)
        }

        /// Property rating details
        if propertyDetails.rating?.overall != nil {
            DetailRatingView(viewModel: propertyDetails.detailRatingViewModel)
        }

        /// Property location on the map
        if let mapMarker = propertyDetails.mapMarker {
            MapView(marker: mapMarker)
        }

        /// Directions to the property
        if !propertyDetails.directions.isEmpty {
            let directiontionViewModel = ShortDescriptionViewModel(
                header: .directions,
                details: propertyDetails.directions)
            ShortDescriptionView(viewModel: directiontionViewModel)
        }
    }
    .padding(.horizontal)
}

private extension PropertyDetails {
    var detailRatingViewModel: DetailRatingViewModel {
        DetailRatingViewModel(
            header: "Reviews",
            rating: self.rating?.overall ?? 0,
            totalRating: Int(self.totalRatings) ?? 0,
            ratingInfo: [
                ("Value for money", rating?.valueForMoney ?? 0),
                ("Security", rating?.security ?? 0),
                ("Atmosphere", rating?.atmosphere ?? 0),
                ("Cleanliness", rating?.cleanliness ?? 0),
                ("Staff", rating?.staff ?? 0),
                ("Location", rating?.location ?? 0),
                ("Facilities", rating?.facilities ?? 0)
            ])
    }

    var propertySummaryViewModel: PropertySummaryViewModel {
        PropertySummaryViewModel(
            name: name,
            type: type,
            address: fullAddress,
            rating: rating?.overall,
            totalRating: Int(totalRatings)
        )
    }

    var startsAt: String? {
        checkIn?.startsAt?.asString
    }

    var endsAt: String? {
        checkIn?.endsAt?.asString
    }

    var mapMarker: MapMarker? {
        if let latitude = Double(latitude),
           let longitude = Double(longitude) {
            return MapMarker(name: name, latitude: latitude, longitude: longitude)
        }

        return nil
    }

    var fullAddress: String {
        if address2.isEmpty {
            String(
                format: "%@, %@, %@",
                address1,
                city.name,
                city.country)
        } else {
            String(
                format: "%@, %@, %@, %@",
                address1,
                address2,
                city.name,
                city.country)
        }
    }
}

private extension String {
    static let description = "Description"
    static let directions = "Directions"
}

#Preview {
    PropertyDetailsView(
        viewModel: PropertyDetailsViewModel(proprtyId: "32849"))
}
