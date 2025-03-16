//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct ArtistView: View {
    
    let artist: any UIOArtist
    
    var body: some View {
        ImageView(url: artist.imageUrl)
            .overlay(alignment: .bottomLeading) {
                Text(artist.name)
                    .adaptiveFont(.body1(.medium))
                    .adaptiveForeground(.text)
                    .padding(.leading, Theme.size(.size200))
                    .padding(.bottom, Theme.size(.size100))
            }
    }
    
}
