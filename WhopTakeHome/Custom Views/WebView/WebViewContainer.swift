//
//  WebViewContainer.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/12/24.
//

import SwiftUI

struct WebViewContainer: View {
    public let url: URL?
    @State private var stateManager: WebViewStateManager

    init(urlString: String) {
        let url = URL(string: urlString)
        self.url = url
        // if we have a nil URL for any reason, set the view state to error immediately
        self.stateManager = WebViewStateManager(state: (url == nil) ? .error(URLError(.badURL)) : .loading)
    }

    var body: some View {
        ZStack {
            if case .error = stateManager.state {
                errorView
            } else if let url {
                // in the case of an error, don't show the WebView at all, as it will override ZStack and render on top of error
                WebView(url: url, stateManager: stateManager)

                if case .loading = stateManager.state {
                    LoadingView()
                }
            }
        }
    }

    private var errorView: some View {
        VStack {
            Image(systemName: SystemImage.warning)
                .padding(.bottom, 10.0)
                .accessibilityHidden(true) // not necessary for VoiceOver
            Text(Strings.failed_to_load_page)
                .font(.custom("Courier-New", size: 16.0))
        }
    }
}
