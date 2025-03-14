//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol UIOArtist {
    
    var name: String { get }
    var numberOfAlbums: Int { get }
    var genre: [String] { get }
    
}
