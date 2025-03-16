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
                artistView
                ForEach(artist.albums, id: \.id) { album in
                    albumView(album)
                    Spacer(minLength: Theme.size(.size400))
                }
            }
        }
        .navigationTitle(artist.name)
    }
    
    private var artistView: some View {
        VStack(spacing: 0) {
            ImageView(url: artist.imageUrl)
                .frame(width: 150, height: 150)
                .padding(.bottom, Theme.size(.size300))
            Text(artist.name)
                .adaptiveFont(.header(.medium))
            Text(artist.genre.joined(separator: ", "))
                .adaptiveFont(.body1)
            Text("\(artist.albums.count) album".pluralIfNeeded(artist.albums.count))
                .adaptiveFont(.body1)
        }
        .frame(maxWidth: .infinity)
        .padding(Theme.size(.size200))
    }
    
    private func albumView(_ album: any UIOAlbum) -> some View {
        Section {
            Divider()
            ForEach(album.tracks, id: \.id) { track in
                TrackView(track: track)
            }
            Divider()
        } header: {
            sectionHeader(album.title)
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .adaptiveFont(.body1(.medium))
                .adaptiveForeground(.text)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom, Theme.size(.size100))
        .padding(.top, Theme.size(.size200))
        .padding(.horizontal, Theme.size(.size200))
        .frame(maxWidth: .infinity, alignment: .leading)
        .adaptiveBackground(.background)
    }
    
}
