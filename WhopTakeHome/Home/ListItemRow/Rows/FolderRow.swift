//
//  FolderRow.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

import SwiftUI

struct FolderRow: View {
    public let folderItem: FolderItem
    @Environment(FolderStateCache.self) private var folderStateCache

    var body: some View {
        // DisclosureGroup for expand/collapse as List doesn't currently allow for manual
        // `isExpanded` manipulation
        DisclosureGroup(isExpanded: isFolderExpanded) {
            childrenList
        } label: {
            folderBody
        }
        .tint(.primary)
    }

    private var folderBody: some View {
        HStack {
            Image(systemName: SystemImage.folder)
            Text(folderItem.title)
        }
    }

    private var childrenList: some View {
        ForEach(folderItem.items) { item in
            ListItemRow(item: item)
        }
        .padding(.leading)
    }
}

// MARK: - Helpers

private extension FolderRow {

    var isFolderExpanded: Binding<Bool> {
        Binding(get: {
            folderStateCache.isFolderExpanded(id: folderItem.id)
        }, set: { _ in
            folderStateCache.toggleFolderExpand(id: folderItem.id)
        })
    }
}

#Preview {
    let items: [ListItem] = [
        .link(LinkItem(title: "Whop", urlString: "https://www.whop.com")),
        .link(LinkItem(title: "Whop", urlString: "https://www.whop.com"))
    ]
    FolderRow(folderItem: FolderItem(title: "Folder", items: items))
        .environment(FolderStateCache())
}
