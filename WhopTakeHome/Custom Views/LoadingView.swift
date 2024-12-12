//
//  LoadingView.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/12/24.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        ProgressView(Strings.loading + "...")
            .progressViewStyle(.circular)
    }
}
