//
//  HomeViewModelTests.swift
//  WhopTakeHomeTests
//
//  Created by Stephen Sowole on 12/4/24.
//

import Testing
@testable import WhopTakeHome

@MainActor struct HomeViewModelTests {

    enum TestError: Error {
        case incorrectViewState(HomeViewModel.ViewState)
    }

    @Test func initialState() {
        let viewModel = HomeViewModel()
        #expect(viewModel.viewState == .loading)
        #expect(viewModel.items.isEmpty)
    }

    @Test func itemsFetch() async {
        let viewModel = HomeViewModel()
        #expect(viewModel.items.count == 0)

        await viewModel.loadItems()
        #expect(viewModel.items.count > 0)

        let currentItemsCount = viewModel.items.count
        await viewModel.fetchNextPage()
        #expect(viewModel.items.count > currentItemsCount)
    }

    @Test func viewStateChange() async throws {
        let viewModel = HomeViewModel()
        #expect(viewModel.viewState == .loading)

        await viewModel.loadItems()
        guard case .content = viewModel.viewState else {
            throw TestError.incorrectViewState(viewModel.viewState)
        }
    }
}
