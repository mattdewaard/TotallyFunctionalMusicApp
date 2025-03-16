//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

final class FavouritesFacade: FavouritesProtocol {
    
}

extension FavouritesFacade: FavouriteTracksProtocol {
    
    func getFavourites() async throws -> [DTOTrack] {
        try await FavouritesUseCase().get()
    }
    
    func isFavourite(_ trackId: String) async throws -> Bool {
        try await FavouritesUseCase().isFavourite(trackId)
    }
    
    func addFavourite(_ trackId: String) async throws {
        try await FavouritesUseCase().add(trackId)
    }
    
    func removeFavourite(_ trackId: String) async throws {
        try await FavouritesUseCase().remove(trackId)
    }
    
}

extension FavouritesFacade: RecentTracksProtocol {
    
    func getRecents() async throws -> [DTOTrack] {
        try await RecentsUseCase().get()
    }
    
    func addRecent(_ trackId: String) async throws {
        try await RecentsUseCase().add(trackId)
    }
    
}
