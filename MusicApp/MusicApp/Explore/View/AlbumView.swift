//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct AlbumView: View {
    
    let album: UIOAlbum
    
    var body: some View {
        HStack(spacing: Theme.size(.size100)) {
            
            ImageView(url: album.coverArtUrl)
                .frame(width: Theme.size(.size500), height: Theme.size(.size500))
                .adaptiveForeground(.tint)
                .padding(.leading, Theme.size(.size200))
            
            VStack(alignment: .leading, spacing: Theme.size(.size050)) {
                Text(album.title)
                    .adaptiveFont(.body1(.medium))
                    .adaptiveForeground(.text)
                HStack {
                    Text(album.artist)
                        .adaptiveFont(.body2)
                        .adaptiveForeground(.subtext)
                    Circle()
                        .frame(width: Theme.size(.size050), height: Theme.size(.size050))
                        .adaptiveForeground(.subtext)
                    
                    Text(tracksText)
                        .adaptiveFont(.body2)
                        .adaptiveForeground(.subtext)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing, Theme.size(.size200))
        }
        .padding(.vertical, Theme.size(.size200))
        .adaptiveBackground(.backgroundContent)
        .overlay(alignment: .bottom) {
            Divider()
        }
    }
    
    private var tracksText: String {
        "\(album.tracks) track".pluralIfNeeded(album.tracks)
    }
    
}

