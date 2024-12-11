//
//  ListItemGenerator.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

struct ListItemGenerator {

    static func generateListItems(count: Int = 20, folderFrequency: Double = 0.5) -> [ListItem] {
        let folderFrequency = max(0.0, min(1.0, folderFrequency))

        return (0..<count).map { _ in
            if Double.random(in: 0...1) <= folderFrequency {
                let children = generateListItems(count: count / 2, folderFrequency: folderFrequency * 0.4)
                let item = FolderItem(title: Strings.folder, items: children)
                return .folder(item)
            } else {
                let item = LinkItem(title: "Link")
                return .link(item)
            }
        }
    }
}
