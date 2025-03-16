//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol UIOAlbum {
    
    associatedtype Track: UIOTrack
    
    var id: String { get }
    var title: String { get }
    var artist: String { get }
    var releaseDate: Date { get }
    var coverArtUrl: String { get }
    var tracks: [Track] { get }
    var genre: [String] { get }
    
}
