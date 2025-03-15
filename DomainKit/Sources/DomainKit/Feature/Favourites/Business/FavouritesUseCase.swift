//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class FavouritesUseCase {
    
    func add(_ trackId: String) throws {
        try FavouritesRepository().add(trackId)
    }
    
    func remove(_ trackId: String) throws {
        try FavouritesRepository().remove(trackId)
    }
    
    func get() async throws -> [DTOTrack] {
        let favouriteIds = try FavouritesRepository().get()
        let tracks = try await TracksFacade().get()
        return tracks.filter { favouriteIds.contains($0.trackId) }
    }
    
}
