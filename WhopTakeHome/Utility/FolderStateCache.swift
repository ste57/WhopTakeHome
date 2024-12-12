//
//  FolderStateCache.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/11/24.
//

import SwiftUI

@MainActor @Observable class FolderStateCache: ObservableObject {

    // MARK: - Interface

    func isFolderExpanded(id: UUID) -> Bool {
        expandedFolders.contains(id)
    }

    func toggleFolderExpand(id: UUID) {
        if expandedFolders.contains(id) {
            expandedFolders.remove(id)
        } else {
            expandedFolders.insert(id)
        }
    }

    // MARK: - Private

    private var expandedFolders: Set<UUID>

    // MARK: - Lifecycle

    init() {
        self.expandedFolders = []
    }
}
