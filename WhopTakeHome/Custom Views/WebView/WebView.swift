//
//  WebView.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/12/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    public let url: URL
    public let stateManager: WebViewStateManager

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(stateManager)
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    let stateManager: WebViewStateManager

    init(_ stateManager: WebViewStateManager) {
        self.stateManager = stateManager
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stateManager.state = .content
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        stateManager.state = .error(error)
    }
}