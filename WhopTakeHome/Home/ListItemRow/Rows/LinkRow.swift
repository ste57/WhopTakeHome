//
//  LinkRow.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/10/24.
//

import SwiftUI

struct LinkRow: View {
    public let linkItem: LinkItem

    var body: some View {
        NavigationLink {
            WebViewContainer(urlString: linkItem.urlString)
        } label: {
            HStack {
                Image(systemName: SystemImage.globe)
                Text(linkItem.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.link)
        .accessibilityLabel(linkItem.title + " " + Strings.link)
    }
}

#Preview {
    LinkRow(linkItem: .init(title: "Whop", urlString: "https//www.whop.com"))
}
