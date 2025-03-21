//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

struct DTOAlbum: Sendable {
    
    let title: String
    let artist: String
    let releaseDate: Date
    let coverArtUrl: String
    let genre: [String]
    let tracks: [DTOTrack]
    
}

