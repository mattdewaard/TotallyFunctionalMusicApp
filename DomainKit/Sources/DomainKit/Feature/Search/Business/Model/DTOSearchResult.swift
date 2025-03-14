//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

enum DTOSearchResult {
    case artists([DTOArtist])
    case albums([DTOAlbum])
    case tracks([DTOTrack])
}
