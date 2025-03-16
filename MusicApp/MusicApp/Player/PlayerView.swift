//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct PlayerView: View {
    
    @EnvironmentObject private var navigation: ContentNavigationViewModel
    @StateObject private var player: PlaybackViewModel
    
    private let track: UIOTrack
    
    init(track: UIOTrack) {
        self.track = track
        _player = StateObject(wrappedValue: PlaybackViewModel(duration: track.duration))
    }
    
    var body: some View {
        if navigation.showTrackAsFocused {
            FullscreenPlayerView(track: track)
                .environmentObject(player)
                .transition(.move(edge: .bottom).combined(with: .offset(y: 50)))
                .zIndex(1)
        } else {
            MinimizedPlayerView(track: track)
                .padding(Theme.size(.size200))
                .environmentObject(player)
                .offset(y: -40)
                .zIndex(0)
        }
    }
    
}
