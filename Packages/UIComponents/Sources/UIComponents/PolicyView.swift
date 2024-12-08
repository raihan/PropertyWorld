//
//  PolicyView.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/4/24.
//

import SwiftUI

public struct PolicyView: View {
    let policies: [String]

    public init(policies: [String]) {
        self.policies = policies
    }

    public var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(policies, id: \.self) { policy in
                    Text(policy)
                        .font(.system(size: 14))
                        .padding(
                            .init(top: 5, leading: 12, bottom: 5, trailing: 12))
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(15)
                }
            }
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    PolicyView(policies: [
        "Child Friendly",
        "Credit Cards Accepted",
        "No Curfew",
        "Non Smoking",
        "Pet Friendly",
        "Taxes Included"
    ])
    .padding()
    .background(Color(uiColor: .systemGray3))
}
