//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class ExploreFacade: ExploreProtocol {
    
    func getArtists() async throws -> [DTOArtist] {
        try await ArtistUseCase().get()
    }
    
    func getAlbums() async throws -> [DTOAlbum] {
        try await AlbumUseCase().get()
    }
    
}
