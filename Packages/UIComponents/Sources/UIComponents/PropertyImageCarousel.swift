//
//  PropertyImageCarousel.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI

public struct PropertyImageCarousel: View {
    @State private var currentIndex = 0

    let images: [URL?]

    var itemHeight: CGFloat {
        (UIScreen.main.bounds.width - 40) * 0.75
    }

    public init(images: [URL?]) {
        self.images = images
    }

    public var body: some View {
        VStack(spacing:0) {
            TabView(selection:$currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    PropertyImageView(url: images[index])
                        .tag(index)
                }
            }
            .frame(height: itemHeight)
            .cornerRadius(10)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        }
    }
}

#Preview {
    PropertyImageCarousel(images: [
        URL(string: "https://u.hwstatic.com/propertyimages/3/32849/1.jpg"),
        URL(string: "https://u.hwstatic.com/propertyimages/3/32849/7.jpg")
    ])
    .padding()
}
