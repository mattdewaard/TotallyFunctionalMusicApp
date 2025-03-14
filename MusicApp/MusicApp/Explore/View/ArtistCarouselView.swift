//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct ArtistCarouselView: View {
    
    let artists: [UIOArtist]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: Theme.size(.size400)) {
                ForEach(artists, id: \.name) { artist in
                    ArtistView(artist: artist)
                }
            }
            .padding(.horizontal, Theme.size(.size200))
        }
    }
    
}
