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
        if let largeFont = UIFont(name: "Courier", size: 28.0) {
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: largeFont]
        }
        if let titleFont = UIFont(name: "Courier", size: 20.0) {
            UINavigationBar.appearance().titleTextAttributes = [.font: titleFont]
        }
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
            .animation(.easeInOut, value: viewModel.viewState == .loading)
            .navigationTitle(Strings.files)
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private func itemList(_ items: [ListItem]) -> some View {
        List {
            ForEach(items) { item in
                ListItemRow(item: item)
                    .onAppear {
                        if item.id == items[items.count - 4].id {
                            viewModel.fetchNextPage()
                        }
                    }
            }
        }
        .listStyle(.plain)
        .transaction { transaction in
            transaction.disablesAnimations = true
        }
    }
}

#Preview {
    HomeView()
}
