//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOArtist: UIOSearchResult {
    
    var title: String {
        name
    }
    
    var detail: String {
        numberOfAlbums == 1 ? "1 album" : "\(numberOfAlbums) albums"
    }
    
}
