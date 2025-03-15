//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct ArtistView: View {
    
    let artist: UIOArtist
    
    var body: some View {
        VStack(alignment: .leading, spacing: Theme.size(.size050)) {
            ImageView(url: artist.imageUrl)
                .frame(width: 100, height: 100)
                Text(artist.name)
                    .adaptiveFont(.body1(.medium))
                    .adaptiveForeground(.text)
                Text(albumsText)
                    .adaptiveFont(.body2)
                    .adaptiveForeground(.subtext)
                Text(artist.genre.first ?? "")
                    .adaptiveFont(.body2)
                    .adaptiveForeground(.subtext)
                    .lineLimit(1)
        }
    }
    
    private var albumsText: String {
        "\(artist.numberOfAlbums) album".pluralIfNeeded(artist.numberOfAlbums)
    }
}

