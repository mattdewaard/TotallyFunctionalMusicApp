//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSearchInterface: Bool = false
    
    var body: some View {
        TabView {
            Group {
                ExploreListView(showSearchInterface: $showSearchInterface)
                    .tabItem {
                        Label.init("Explore", systemImage: "waveform.badge.magnifyingglass")
                    }
            }
            .adaptiveBackground(.background)
        }
        .overlay {
            if showSearchInterface {
                SearchView(isPresented: $showSearchInterface)
            }
        }
        .animation(.easeInOut, value: showSearchInterface)
    }
}

#Preview {
    ContentView()
}
