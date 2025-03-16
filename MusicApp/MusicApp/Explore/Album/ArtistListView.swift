//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct ArtistListView: View {
    
    let artist: any UIOArtist
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                ForEach(artist.albums, id: \.id) { album in
                    albumView(album)
                    Spacer(minLength: Theme.size(.size600))
                }
            }
        }
        .navigationTitle(artist.name)
    }
    
    private func albumView(_ album: any UIOAlbum) -> some View {
        Section {
            ForEach(album.tracks, id: \.id) { track in
                TrackView(track: track)
            }
        } header: {
            sectionHeader(album.title)
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .adaptiveFont(.header(.medium))
                .adaptiveForeground(.text)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom, Theme.size(.size100))
        .padding(.horizontal, Theme.size(.size200))
        .frame(maxWidth: .infinity, alignment: .leading)
        .adaptiveBackground(.background)
    }
    
}
