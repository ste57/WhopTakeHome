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
        Task {
            // fetch items as soon as this view is created
            await loadItems()
        }
    }
}

// MARK: - Interface

extension HomeViewModel {

    public func loadItems() async {
        let items = await generateItems()
        viewState = .content(items)
    }

    public func fetchNextPage() async {
        guard
            !isFetchingData,
            case .content(let currentItems) = viewState
        else { return }

        isFetchingData = true
        defer { isFetchingData = false }

        let newItems = await generateItems()
        viewState = .content(currentItems + newItems)
    }

    private func generateItems() async -> [ListItem] {
        // ensure we're running the generateListItems on a background thread to not block main as there's a very small
        // possibility that we could have a long generation at any given time (depending on how many nested folders are generated)
        await Task.detached(priority: .userInitiated) {
            ListItemGenerator.generateListItems()
        }.value
    }
}
