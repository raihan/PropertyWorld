//
//  ErrorView.swift
//  UIComponents
//
//  Created by Abdullah Muhammad Zubair on 12/7/24.
//

import Foundation
import SwiftUI

public struct ErrorView: View {
    let message: String
    var tryAgainAction: (() -> Void)?

    public init(message: String, tryAgainAction: ( () -> Void)? = nil) {
        self.message = message
        self.tryAgainAction = tryAgainAction
    }

    public var body: some View {
        ContentUnavailableView {
            Label(String.errorLabel,
                  systemImage: .errorImage)
        } description: {
            Text(message)
        } actions: {
            Button(String.tryAgain) {
                tryAgainAction?()
            }
            .font(.body.bold())
            .foregroundStyle(.white)
            .padding()
            .background(.purple)
            .clipShape(Capsule())
        }
    }
}

private extension String {
    static let errorLabel = "Something went wrong!"
    static let tryAgain = "Try Again"
    static let errorImage = "exclamationmark.triangle"
}

#Preview {
    ErrorView(message: "Please try again!")
}
