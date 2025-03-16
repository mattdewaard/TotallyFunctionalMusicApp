//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class SearchUseCase {
    
    func search(by term: String) async throws -> [UIOSearchResult] {
        let searchTerm = term.lowercased()
        
        let matchingTracks = try await getMatchingTracks(for: searchTerm)
        let (matchingArtists, matchingAlbums) = try await getMatchingArtistsAndAlbums(for: searchTerm)
        
        var results: [UIOSearchResult] = []
        if !matchingArtists.isEmpty {
            results.append(.artists(matchingArtists))
        }
        if !matchingAlbums.isEmpty {
            results.append(.albums(matchingAlbums))
        }
        if !matchingTracks.isEmpty {
            results.append(.tracks(matchingTracks))
        }
        return results
    }
    
}

extension SearchUseCase {
    
    private func getMatchingTracks(for searchTerm: String) async throws -> [DTOTrack] {
        let tracks = try await TracksFacade().get()
        return tracks.filter { track in
            track.title.lowercased().contains(searchTerm)
        }
    }
    
    private func getMatchingArtistsAndAlbums(for searchTerm: String) async throws -> (artists: [DTOArtist], albums: [DTOAlbum]) {
        let artists = try await ExploreFacade().getArtists()
        
        var matchingArtists: [DTOArtist] = []
        var matchingAlbum: [DTOAlbum] = []
        
        for artist in artists {
            if artist.name.lowercased().contains(searchTerm) {
                matchingArtists.append(artist)
            }
            for album in artist.albums {
                if album.title.lowercased().contains(searchTerm) {
                    matchingAlbum.append(album)
                }
            }
        }
        return (matchingArtists, matchingAlbum)
    }
    
}
