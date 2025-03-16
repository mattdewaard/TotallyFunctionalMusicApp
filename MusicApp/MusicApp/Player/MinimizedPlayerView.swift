//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct MinimizedPlayerView: View {
    
    @EnvironmentObject private var navigation: ContentNavigationViewModel
    @EnvironmentObject private var player: PlaybackViewModel
    
    let track: UIOTrack
    
    init(track: UIOTrack) {
        self.track = track
    }
    
    var body: some View {
        HStack(spacing: Theme.size(.size100)) {
            ImageView(url: track.coverArtUrl)
                .frame(width: Theme.size(.size500), height: Theme.size(.size500))
            
            VStack(alignment: .leading, spacing: Theme.size(.size050)) {
                Text(track.title)
                    .adaptiveFont(.body1(.medium))
                Text(track.artistName)
                    .adaptiveFont(.body2)
                    .adaptiveForeground(.subtext)
            }
            
            Spacer()
            
            PlayButtonView(isPlaying: $player.isPlaying)
                .animation(.spring(), value: player.isPlaying)
                .frame(width: Theme.size(.size200), height: Theme.size(.size200))
                .onTapGesture {
                    if player.isPlaying {
                        player.stop()
                    } else {
                        player.start()
                    }
                }
        }
        .padding(.vertical, Theme.size(.size100))
        .padding(.horizontal, Theme.size(.size200))
        .adaptiveBackground(.backgroundContent)
        .modifier(DismissGesture(cornerRadius: 0, threshold: 20, onDismiss: {
            navigation.closePlayer()
        }))
        .clipShape(RoundedRectangle(cornerRadius: Theme.size(.size100)))
        .shadow(color: Color.black.opacity(0.1), radius: Theme.size(.size100), x: 0, y: 0)
        .onTapGesture {
            navigation.play(track)
        }
    }
    
}
