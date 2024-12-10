//
//  ListItemGenerator.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

struct ListItemGenerator {

    static func generateListItems(count: Int) async -> [ListItem] {
        var items: [ListItem] = []

        for _ in 0..<count {
            items.append(.link(LinkItem()))
        }
        return items
    }
}
