//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct NoSearchResultsView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, Theme.size(.size600))
            Text("No results found")
                .adaptiveFont(.body1(.medium))
                .padding(.bottom, Theme.size(.size100))
            Text("Try expanding your search or using explore to find new music")
                .adaptiveFont(.body2)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .adaptiveForeground(.subtext)
    }
}

#Preview {
    NoSearchResultsView()
}
