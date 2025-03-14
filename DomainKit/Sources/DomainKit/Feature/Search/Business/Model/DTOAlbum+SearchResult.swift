//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOAlbum: UIOSearchResult {
    
    var detail: String {
        tracks == 1 ? "1 track" : "\(tracks) tracks"
    }
    
}
