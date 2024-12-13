//
//  ListItemGenerator.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

struct ListItemGenerator {
    /// Generates a list of items with a mix of folders and links.
    ///
    /// Each item is probabilistically a folder or link based on `folderFrequency`. Folder items may contain
    /// nested items generated recursively, with the folder probability decreasing by 60% (multiplied by 0.4)
    /// for each level of nesting.
    ///
    /// - Parameters:
    ///   - count: Number of items to generate. Defaults to 20.
    ///   - folderFrequency: Probability (0.0 to 1.0) of an item being a folder. Defaults to 0.5.
    /// - Returns: An array of `ListItem` objects (folders or links).
    static func generateListItems(count: Int = 20, folderFrequency: Double = 0.5) -> [ListItem] {
        let folderFrequency = max(0.0, min(1.0, folderFrequency))

        return (0..<count).map {
            if Double.random(in: 0...1) <= folderFrequency {
                // split list items in half for each nesting and reduce frequency by 60%
                let children = generateListItems(count: max(1, count / 2),
                                                 folderFrequency: folderFrequency * 0.4)
                // fetch random title to generate folder
                let title = sampleFolderTitles.randomElement() ?? "Folder \($0)"
                return .folder(FolderItem(title: title, items: children))

            } else {
                // fetch random title to generate link
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
