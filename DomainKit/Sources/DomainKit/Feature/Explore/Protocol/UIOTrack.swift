//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol UIOTrack {
    
    var id: String { get }
    var title: String { get }
    var coverArtUrl: String { get }
    var albumName: String { get }
    var artistName: String { get }
    var length: String { get }
    
}
