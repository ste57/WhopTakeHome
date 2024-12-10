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

    public private(set) var viewState: ViewState

    public var items: [ListItem] {
        guard case .content(let items) = viewState else { return [] }
        return items
    }

    enum ViewState: Equatable {
        case loading
        case content([ListItem])
    }

    // MARK: - Lifecycle

    init() {
        self.viewState = .loading
    }
}

// MARK: - Interface

extension HomeViewModel {

    func loadItems() {
        Task {
            let items = ListItemGenerator.generateListItems()
            viewState = .content(items)
        }
    }
}
