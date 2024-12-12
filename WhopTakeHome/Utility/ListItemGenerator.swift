//
//  ListItemGenerator.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

struct ListItemGenerator {

    static func generateListItems(count: Int = 20, folderFrequency: Double = 0.5) -> [ListItem] {
        let folderFrequency = max(0.0, min(1.0, folderFrequency))

        return (0..<count).map {
            if Double.random(in: 0...1) <= folderFrequency {
                let children = generateListItems(count: max(1, count / 2),
                                                 folderFrequency: folderFrequency * 0.4)
                let title = sampleFolderTitles.randomElement() ?? "Folder \($0)"
                return .folder(FolderItem(title: title, items: children))

            } else {
                let link = sampleLinks.randomElement() ?? ("Link \($0)", "")
                return .link(LinkItem(title: link.title, urlString: link.urlString))
            }
        }
    }
}

extension ListItemGenerator {

    static let sampleFolderTitles = [
        "Dashboard",
        "Projects",
        "Documentation",
        "Resources",
        "Accounts",
        "Settings",
        "Reports",
        "Legacy Items",
        "Miscellaneous",
        "New Features"
    ]

    static let sampleLinks: [(title: String, urlString: String)] = [
        (title: "Whop", urlString: "https://whop.com"),
        (title: "Unreachable Host", urlString: "https://no-such-domain-404.com"),
        (title: "Incomplete URL", urlString: "www.missing-schema"),
        (title: "Localhost", urlString: "http://localhost:3000"),
        (title: "Empty URL", urlString: "")
    ]
}
