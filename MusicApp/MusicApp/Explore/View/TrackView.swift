//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct TrackView: View {
    
    @EnvironmentObject var navigation: ContentNavigationViewModel
    
    let track: UIOTrack
    
    var body: some View {
        Button {
            navigation.play(track)
        } label: {
            HStack(spacing: Theme.size(.size100)) {
                
                ImageView(url: track.coverArtUrl)
                    .frame(width: Theme.size(.size500), height: Theme.size(.size500))
                    .adaptiveForeground(.tint)
                
                VStack(alignment: .leading, spacing: Theme.size(.size050)) {
                    Text(track.title)
                        .adaptiveFont(.body1(.medium))
                        .adaptiveForeground(.text)
                    HStack {
                        Text(track.artistName)
                            .adaptiveFont(.body2)
                            .adaptiveForeground(.subtext)
                        Circle()
                            .frame(width: Theme.size(.size050), height: Theme.size(.size050))
                            .adaptiveForeground(.subtext)
                        
                        Text(track.length)
                            .adaptiveFont(.body2)
                            .adaptiveForeground(.subtext)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, Theme.size(.size200))
        }
        .overlay(alignment: .bottom) {
            Divider()
        }
    }
    
}
