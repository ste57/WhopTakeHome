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
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading)
    }

    private var childrenList: some View {
        ForEach(folderItem.items) { item in
            ListItemRow(item: item)
        }
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
        .link(LinkItem(title: "Link1")),
        .link(LinkItem(title: "Link2"))
    ]
    FolderRow(folderItem: FolderItem(title: "Folder", items: items))
        .environment(FolderStateCache())
}
