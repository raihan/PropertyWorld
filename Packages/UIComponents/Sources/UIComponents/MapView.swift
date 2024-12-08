//
//  MapView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI
import MapKit

public struct MapMarker: Identifiable {
    public let id = UUID()
    public let name: String
    public let latitude: Double
    public let longitude: Double

    public init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}

public struct MapView: View {
    let marker: MapMarker
    private var position: MapCameraPosition {
        .camera(
            .init(centerCoordinate: CLLocationCoordinate2DMake(marker.latitude, marker.longitude), distance: 10_000)
        )
    }

    public init(marker: MapMarker) {
        self.marker = marker
    }

    public var body: some View {
        Map(position: .constant(position)) {
            Marker(marker.name, coordinate:  CLLocationCoordinate2DMake(marker.latitude, marker.longitude))
        }
        .frame(height: 200)
        .cornerRadius(5)
    }
}

#Preview {
    MapView(marker: MapMarker(
        name: "STF Vandrarhem Stigbergsliden",
        latitude: 57.6992285,
        longitude: 11.9368171))
    .padding()
}
