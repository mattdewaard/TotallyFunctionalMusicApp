//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

@MainActor
final class ExploreListViewModel: ObservableObject {

    @Published private(set) var artists: [any UIOArtist] = []
    @Published private(set) var albums: [any UIOAlbum] = []
    @Published private(set) var tracks: [UIOTrack] = []
    
    private let usecase: any ExploreProtocol
    
    init(usecase: any ExploreProtocol = DomainKitFacade.explore) {
        self.usecase = usecase
    }
    
    func setup() async throws {
        self.artists = try await usecase.getArtists()
        self.albums = try await usecase.getAlbums()
        self.tracks = try await usecase.getTracks()
    }
    
    var displayArtists: [any UIOArtist] {
        Array(artists.prefix(10))
    }
    
    var displayAlbums: [any UIOAlbum] {
        Array(albums.prefix(10))
    }
    
    var displayTracks: [UIOTrack] {
        Array(tracks.sorted(by: { $0.title < $1.title }).prefix(10))
    }
    
}
