//
//  PropertyImageView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/3/24.
//

import SwiftUI

public struct PropertyImageView: View {
    var url: URL?

    public init(url: URL?) {
        self.url = url
    }

    public var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(.placeholder)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

private extension String {
    static let placeholder = "placeholder"
}

#Preview {
    PropertyImageView(url: URL(string: "https://u.hwstatic.com/propertyimages/3/32849/1.jpg"))
        .frame(width: 360, height: 270)
}
