//
//  ListItemGeneratorTests.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/12/24.
//

import Testing
import Foundation
@testable import WhopTakeHome

struct ListItemGeneratorTests {

    enum TestError: Error {
        case unexpectedItemType(ListItem)
     }

    @Test func defaultGeneration() {
        let items = ListItemGenerator.generateListItems()
        #expect(items.count == 20) // default
    }

    @Test func customCount() {
        let count = 10
        let items = ListItemGenerator.generateListItems(count: count)
        #expect(items.count == count)
    }

    @Test func allLinks() throws {
        let items = ListItemGenerator.generateListItems(count: 10, folderFrequency: 0.0)

        for item in items {
            guard case .link = item else {
                throw TestError.unexpectedItemType(item)
            }
        }
    }

    @Test func folderStructure() {
        let items = ListItemGenerator.generateListItems(count: 10, folderFrequency: 1.0)

        for item in items {
            if case .folder(let folderItem) = item {
                #expect(folderItem.title.isEmpty == false)
                #expect(folderItem.items.count == 5) // default
            }
        }
    }

    @Test func linkStructure() {
        let items = ListItemGenerator.generateListItems(count: 10, folderFrequency: 0.0)

        for item in items {
            if case .link(let linkItem) = item {
                #expect(linkItem.title.isEmpty == false)
            }
        }
    }

    @Test func reducedFolderChildFrequency() throws {
        let items = ListItemGenerator.generateListItems(count: 10, folderFrequency: 1.0)

        for item in items {
            guard case .folder = item else {
                throw TestError.unexpectedItemType(item)
            }
        }
        let firstFolder = try #require(items.first)
        #expect(items.count == 10)

        guard case .folder(let folder) = firstFolder else {
            throw TestError.unexpectedItemType(firstFolder)
        }
        var childFolderCount = 0
        for child in folder.items {
            if case .folder = child {
                childFolderCount += 1
            }
        }
        #expect(folder.items.count == 5)
        #expect(childFolderCount < 5)
    }

    @Test func folderFrequencyBounds() throws {
        let highFreq = ListItemGenerator.generateListItems(count: 10, folderFrequency: 1.5)
        let lowFreq = ListItemGenerator.generateListItems(count: 10, folderFrequency: -0.5)
        let noItems = ListItemGenerator.generateListItems(count: 0, folderFrequency: 0.0)
        let oneItem = ListItemGenerator.generateListItems(count: 1, folderFrequency: 1.0)

        #expect(highFreq.count == 10)
        #expect(lowFreq.count == 10)
        #expect(noItems.count == 0)
        #expect(oneItem.count == 1)

        let firstFolder = try #require(oneItem.first)

        guard case .folder(let folder) = firstFolder else {
            throw TestError.unexpectedItemType(firstFolder)
        }
        #expect(folder.items.count == 1) // always at least 1 child item
    }
}
