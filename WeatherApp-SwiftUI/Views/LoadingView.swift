//
//  LoadingView.swift
//  WeatherApp-SwiftUI
//
//  Created by Gembali Sandesh Kumar on 08/01/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)

            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .foregroundColor(.blue)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
