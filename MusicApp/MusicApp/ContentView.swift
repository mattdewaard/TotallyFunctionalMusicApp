//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreListView()
                .tabItem {
                    Label.init("Explore", systemImage: "waveform.badge.magnifyingglass")
                }
        }
        .adaptiveBackground(.background)
    }
}

#Preview {
    ContentView()
}
