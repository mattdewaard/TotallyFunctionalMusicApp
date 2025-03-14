//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

@MainActor
final class ExploreListViewModel: ObservableObject {

    @Published private(set) var artists: [UIOArtist] = []
    @Published private(set) var albums: [UIOAlbum] = []
//    @Published private(set) var artists: [UIOTracks] = []
    
    private let usecase: any ExploreProtocol
    
    init(usecase: any ExploreProtocol = DomainKitFacade.explore) {
        self.usecase = usecase
    }
    
    func setup() async throws {
        self.artists = try await usecase.getArtists()
        self.albums = try await usecase.getAlbums()
    }
    
}
