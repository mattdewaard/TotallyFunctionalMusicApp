//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation
import DomainKit

@MainActor
final class PlayerViewModel: ObservableObject {
    
    @Published private(set) var track: UIOTrack
    @Published private(set) var isFavourite: Bool = false
    
    private let favouritesUsecase: any FavouritesProtocol
    private let tracksUsecase: any TracksProtocol
    
    init(track: UIOTrack,
         favouritesUsecase: any FavouritesProtocol = DomainKitFacade.favourite,
         tracksUsecase: any TracksProtocol = DomainKitFacade.tracks) {
        self.track = track
        self.favouritesUsecase = favouritesUsecase
        self.tracksUsecase = tracksUsecase
    }
    
    func loadTrack() async throws {
        isFavourite = try await favouritesUsecase.isFavourite(track.id)
        try? await favouritesUsecase.addRecent(track.id)
    }
    
}
