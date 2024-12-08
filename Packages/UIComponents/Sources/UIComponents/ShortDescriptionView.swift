//
//  ShortDescriptionView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI

public struct ShortDescriptionViewModel {
    let header: String
    let details: String

    public init(header: String, details: String) {
        self.header = header
        self.details = details
    }
}

public struct ShortDescriptionView: View {
    let viewModel: ShortDescriptionViewModel
    @State private var isExpanded: Bool = false

    public init(viewModel: ShortDescriptionViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.header)
                .font(.headline)

            HStack {
                Text(viewModel.details)
                    .font(.system(size: 14))
                    .lineLimit(isExpanded ? nil : 3)
                    .animation(.smooth, value: isExpanded)

                Spacer()
            }

            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Text(isExpanded
                     ? String.viewLess
                     : String.viewMore)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.top, 1.0)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(5)
    }
}

private extension String {
    static let viewMore = "View more"
    static let viewLess = "View less"
}

#Preview {
    let viewModel = ShortDescriptionViewModel(
        header: "Description",
        details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    ShortDescriptionView(viewModel: viewModel)
}
