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
        switch self {
        case .link(let link): return link.id
        case .folder(let folder): return folder.id
        }
    }

    var title: String {
        switch self {
        case .link(let link): return link.title
        case .folder(let folder): return folder.title
        }
    }

    var imageName: String {
        switch self {
        case .link: return SystemImage.link.systemName
        case .folder: return SystemImage.folder.systemName
        }
    }
}
