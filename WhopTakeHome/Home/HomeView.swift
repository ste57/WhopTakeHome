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
        NavigationStack {
            ZStack {
                switch viewModel.viewState {
                case .loading:
                    LoadingView()

                case .content(let items):
                    list(items: items)
                        .environment(viewModel.folderStateCache)
                }
            }
            .animation(.easeInOut, value: viewModel.viewState)
        }
    }

    private func list(items: [ListItem]) -> some View {
        ScrollView {
            LazyVStack {
                ForEach(items) { item in
                    ListItemRow(item: item)
                        .padding(.all)
                        .onAppear {
                            guard item.id == items[items.count-4].id else { return }
                            viewModel.fetchNextPage()
                        }
                    Divider()
                }
            }
            .padding([.top, .leading, .trailing])
        }
    }
}

#Preview {
    HomeView()
}
