//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOAlbum: UIOAlbum {
    
    var id: String {
        artist + title
    }

}
