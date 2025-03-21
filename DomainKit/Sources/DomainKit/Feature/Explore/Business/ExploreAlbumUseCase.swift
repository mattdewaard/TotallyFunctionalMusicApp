//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

private extension DTOTrack {
    
    var albumKey: String {
        artist.name + album.title
    }
    
}

final class ExploreAlbumUseCase {
    
    func get() async throws -> [DTOAlbum] {
        let tracks = try await TracksFacade().get()
        let tracksByAlbum = Dictionary(grouping: tracks, by: \.albumKey)
        var albums: [DTOAlbum] = []
        
        for (_, tracks) in tracksByAlbum where !tracks.isEmpty {
            albums.append(DTOAlbum(
                title: tracks[0].album.title,
                artist: tracks[0].artist.name,
                releaseDate: tracks[0].releaseDate,
                coverArtUrl: tracks[0].album.coverArtUrl,
                genre: Set(tracks.compactMap(\.genre)).sorted(),
                tracks: tracks.sorted(by: { $0.trackNumber < $1.trackNumber })
            ))
        }
        return albums.sorted(by: { $0.title < $1.title })
    }
    
}
