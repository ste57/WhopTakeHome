//
//  HomeViewModel.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/9/24.
//

import SwiftUI

@MainActor @Observable class HomeViewModel {

    // MARK: - Interface

    public private(set) var viewState: ViewState
    public private(set) var folderStateCache: FolderStateCache

    public var items: [ListItem] {
        guard case .content(let items) = viewState else { return [] }
        return items
    }

    enum ViewState: Equatable {
        case loading
        case content([ListItem])
    }

    // MARK: - Private

    private var isFetchingData = false

    // MARK: - Lifecycle

    init() {
        self.viewState = .loading
        self.folderStateCache = FolderStateCache()
        loadItems()
    }
}

// MARK: - Interface

extension HomeViewModel {

    func loadItems() {
        Task {
            let items = await generateItems()
            viewState = .content(items)
        }
    }

    func fetchNextPage() {
        guard
            !isFetchingData,
            case .content(let currentItems) = viewState
        else { return }

        Task {
            isFetchingData = true
            defer { isFetchingData = false }

            let newItems = await generateItems()
            viewState = .content(currentItems + newItems)
        }
    }

    private func generateItems() async -> [ListItem] {
        await Task.detached(priority: .userInitiated) {
            ListItemGenerator.generateListItems()
        }.value
    }
}
