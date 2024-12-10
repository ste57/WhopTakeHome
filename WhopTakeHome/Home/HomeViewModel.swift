//
//  HomeViewModel.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/9/24.
//

import SwiftUI

@Observable
class HomeViewModel {

    // MARK: - Interface

    public private(set) var items: [ListItem]

    public var isLoading: Bool { // convert to state
        return items.isEmpty
    }

    // MARK: - Lifecycle

    init() {
        self.items = []
    }
}

// MARK: - Interface

extension HomeViewModel {

    func loadItems() {
    }
}
