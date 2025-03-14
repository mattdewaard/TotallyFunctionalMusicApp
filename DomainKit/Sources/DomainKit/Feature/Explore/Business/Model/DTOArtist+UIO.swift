//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOArtist: UIOArtist {
    
    var imageUrl: String {
        ""
    }
    
    var numberOfAlbums: Int {
        albums.count
    }
    
    var genre: [String] {
        Set(albums.flatMap(\.genre)).sorted()
    }
    
}
