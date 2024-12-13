//
//  HomeView.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/9/24.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init() {
        self.viewModel = HomeViewModel()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.viewState {
                case .loading:
                    LoadingView()

                case .content:
                    itemList(viewModel.items)
                        .environment(viewModel.folderStateCache)
                }
            }
            // only animate when switching from loading to content to avoid unnecessary animated transitions
            .animation(.easeInOut, value: viewModel.viewState == .loading)
            .navigationTitle(Strings.files)
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private func itemList(_ items: [ListItem]) -> some View {
        // use a list vs lazyVStack for performance in large data sets
        List {
            ForEach(items) { item in
                ListItemRow(item: item)
                    .task(id: item.id) {
                        // since List doesn't have prefetching yet, simulate by starting the fetch process
                        // 3 items from the bottom. Won't work if items has less than 3 items
                        if item.id == items[items.count - 4].id {
                            await viewModel.fetchNextPage()
                        }
                    }
            }
        }
        .listStyle(.plain) // switch to plain for performance boost
        .transaction { transaction in
            transaction.disablesAnimations = true // disable animations for performance boost
        }
    }
}

#Preview {
    HomeView()
}
