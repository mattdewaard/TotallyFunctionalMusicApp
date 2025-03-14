//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class ExploreArtistUseCase {
    
    func get() async throws -> [DTOArtist] {
        let albums = try await ExploreFacade().getAlbums()
        let albumsByArtist = Dictionary(grouping: albums, by: \.artist)
        
        return albumsByArtist.map { (artist, albums) in
            DTOArtist(name: artist, albums: albums.sorted(by: { $0.title < $1.title } ))
        }.sorted(by: { $0.name < $1.name })
    }
    
}
