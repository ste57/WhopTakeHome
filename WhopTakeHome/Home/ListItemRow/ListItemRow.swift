//
//  ListItemRow.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/11/24.
//

import SwiftUI

struct ListItemRow: View {
    let item: ListItem

    var body: some View {
        switch item {
        case .link(let item):
            LinkRow(linkItem: item)
        case .folder(let item):
            FolderRow(folderItem: item)
        }
    }
}