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

    var id: UUID {
        switch self {
        case .link(let link):
            link.id
        case .folder(let folder):
            folder.id
        }
    }

    var title: String {
        switch self {
        case .link(let link):
            link.title
        case .folder(let folder):
            folder.title
        }
    }
}
