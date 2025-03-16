//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class FavouritesUseCase {
    
    func add(_ trackId: String) async throws {
        try FavouritesRepository().add(trackId)
    }
    
    func remove(_ trackId: String) async throws {
        try FavouritesRepository().remove(trackId)
    }
    
    func isFavourite(_ trackId: String) async throws -> Bool {
        let favouriteIds = try FavouritesRepository().get()
        return favouriteIds.contains(trackId)
    }
    
    func get() async throws -> [DTOTrack] {
        let favouriteIds = try FavouritesRepository().get()
        let tracks = try await TracksFacade().get()
        return tracks.filter { favouriteIds.contains($0.id) }
    }
    
}
