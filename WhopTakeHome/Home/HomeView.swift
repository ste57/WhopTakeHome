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
                List(items) { item in
                    row(for: item)
                }
                .listRowSpacing(12.0)
            }
        }
        .animation(.easeInOut, value: viewModel.viewState)
        .onAppear {
            viewModel.loadItems()
        }
    }
}

private extension HomeView {

    func row(for item: ListItem) -> some View {
        HStack {
            Image(systemName: item.imageName)
                .padding(.trailing, 8.0)

            Text(item.title)
                .font(.custom("Courier", size: 15.0))
        }
    }
}

#Preview {
    HomeView()
}
