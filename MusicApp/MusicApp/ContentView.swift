//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var navigation = ContentNavigationViewModel()
    
    var body: some View {
        TabView {
            Group {
                ExploreListView()
                    .tabItem {
                        Label.init("Explore", systemImage: "waveform.badge.magnifyingglass")
                    }
            }
            .adaptiveBackground(.background)
        }
        .ignoresSafeArea()
        .overlay {
            if let track = navigation.track, navigation.showTrackAsFocused {
                PlayerView(track: track)
                    .id(track.id)
                    .transition(.move(edge: .bottom).combined(with: .offset(y: 50)))
            }
        }
        .overlay {
            if navigation.showSearchInterface {
                SearchView()
            }
        }
        .toolbarBackground(Theme.color(.backgroundContent, in: colorScheme), for: .tabBar)
        .environmentObject(navigation)
        .animation(.easeInOut, value: navigation.showSearchInterface)
        .animation(.spring(), value: navigation.showTrackAsFocused && navigation.track != nil)
    }
}

#Preview {
    ContentView()
}

