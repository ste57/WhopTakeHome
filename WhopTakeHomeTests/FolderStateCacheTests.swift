//
//  FolderStateCacheTests.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/12/24.
//

import Testing
import Foundation
@testable import WhopTakeHome

@MainActor struct FolderStateCacheTests {

    @Test func initialState() {
        let cache = FolderStateCache()
        let randomId = UUID()
        #expect(cache.isFolderExpanded(id: randomId) == false)
    }

    @Test func expandingFolder() {
        let cache = FolderStateCache()
        let folderId = UUID()

        cache.toggleFolderExpand(id: folderId)
        #expect(cache.isFolderExpanded(id: folderId) == true)
    }

    @Test func collapsingFolder() {
        let cache = FolderStateCache()
        let folderId = UUID()

        cache.toggleFolderExpand(id: folderId)
        #expect(cache.isFolderExpanded(id: folderId) == true)

        cache.toggleFolderExpand(id: folderId)
        #expect(cache.isFolderExpanded(id: folderId) == false)
    }

    @Test func multiplefolders() {
        let cache = FolderStateCache()
        let folder1 = UUID()
        let folder2 = UUID()
        let folder3 = UUID()

        cache.toggleFolderExpand(id: folder1)
        cache.toggleFolderExpand(id: folder2)

        #expect(cache.isFolderExpanded(id: folder1) == true)
        #expect(cache.isFolderExpanded(id: folder2) == true)
        #expect(cache.isFolderExpanded(id: folder3) == false)

        cache.toggleFolderExpand(id: folder1)

        #expect(cache.isFolderExpanded(id: folder1) == false)
        #expect(cache.isFolderExpanded(id: folder2) == true)
        #expect(cache.isFolderExpanded(id: folder3) == false)
    }
}
