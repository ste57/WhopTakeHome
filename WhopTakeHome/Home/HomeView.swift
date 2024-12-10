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
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(viewModel.items) { item in
                    row(for: item)
                }
            }
        }
        .animation(.easeInOut, value: viewModel.isLoading)
        .onAppear {
            viewModel.loadItems()
        }
    }
}

private extension HomeView {

    func row(for item: ListItem) -> some View {
        Text("")
    }
}

#Preview {
    HomeView()
}
