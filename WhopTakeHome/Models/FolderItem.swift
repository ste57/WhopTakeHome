//
//  FolderItem.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

import Foundation

struct FolderItem: Equatable {
    let id = UUID().uuidString
    let title: String
    let items: [ListItem]
}
