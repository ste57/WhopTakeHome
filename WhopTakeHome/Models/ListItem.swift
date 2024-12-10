//
//  ListItem.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

import Foundation

enum ListItem: Equatable, Identifiable {
    case link(LinkItem)
    case folder(FolderItem)

    var id: String {
        return UUID().uuidString
    }
}
