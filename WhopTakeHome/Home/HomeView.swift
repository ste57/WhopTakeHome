//
//  HomeView.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/9/24.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView("Loading...")
                    .progressViewStyle(.circular)

            case .content(let items):
                list(items: items)
            }
        }
        .animation(.easeInOut, value: viewModel.viewState)
        .onAppear {
            viewModel.loadItems()
        }
    }

    private func list(items: [ListItem]) -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(items) { item in
                    ListItemRow(item: item)
                        .padding(.all)
                        .onAppear {
                            guard item == items[items.count - 4] else { return }
                            viewModel.fetchNextPage()
                        }
                    Divider()
                }
            }
            .padding([.top, .leading, .trailing])
        }
        .environment(viewModel.folderStateCache)
    }
}

#Preview {
    HomeView()
}
