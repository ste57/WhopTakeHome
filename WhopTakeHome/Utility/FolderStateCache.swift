//
//  FolderStateCache.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/11/24.
//

import SwiftUI

@MainActor @Observable class FolderStateCache: ObservableObject {

    // MARK: - Private

    private var expandedFolders: Set<UUID>

    // MARK: - Lifecycle

    init() {
        self.expandedFolders = []
    }
}

// MARK: - Interface

extension FolderStateCache {
    /// Checks if a folder with the given `id` is expanded.
    /// - Parameter id: The unique identifier of the folder.
    /// - Returns: `true` if the folder is expanded, `false` otherwise.
    func isFolderExpanded(id: UUID) -> Bool {
        expandedFolders.contains(id)
    }

    /// Toggles the expansion state of a folder.
    /// - Parameter id: The unique identifier of the folder.
    /// If the folder is currently expanded, it will be collapsed, and vice versa.
    func toggleFolderExpand(id: UUID) {
        if expandedFolders.contains(id) {
            expandedFolders.remove(id)
        } else {
            expandedFolders.insert(id)
        }
    }
}
