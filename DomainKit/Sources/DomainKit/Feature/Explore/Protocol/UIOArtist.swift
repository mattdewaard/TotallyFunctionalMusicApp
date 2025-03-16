//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol UIOArtist: Sendable {
    
    associatedtype Album: UIOAlbum
    
    var name: String { get }
    var imageUrl: String { get }
    var albums: [Album] { get }
    var genre: [String] { get }
    
}
