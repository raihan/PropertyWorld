//
//  PropertyWorldApp.swift
//  PropertyWorld
//
//  Created by Abdullah Muhammad Zubair on 12/2/24.
//

import SwiftUI

@main
struct PropertyWorldApp: App {
    var body: some Scene {
        WindowGroup {
            PropertyListView(viewModel: PropertyListViewModel())
        }
    }
}
