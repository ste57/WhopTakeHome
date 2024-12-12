//
//  WebViewStateManager.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/12/24.
//

import SwiftUI

@Observable class WebViewStateManager {

    // MARK: - Interface

    public var state: ViewState

    enum ViewState {
        case loading
        case content
        case error(Error)
    }

    // MARK: - Lifecycle

    init(state: ViewState) {
        self.state = state
    }
}
