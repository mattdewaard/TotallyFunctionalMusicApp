//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOAlbum: UIOSearchResult {
    
     public var imageUrl: String {
         coverArtUrl
     }
     
    var detail: String {
        "\(tracks) track".pluralIfNeeded(tracks)
    }
    
}
