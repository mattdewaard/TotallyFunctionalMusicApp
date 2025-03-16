//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public enum UIOSearchResult: Sendable {
    case artists([any UIOArtist])
    case albums([any UIOAlbum])
    case tracks([UIOTrack])
}


public extension UIOSearchResult {
    
    var title: String {
        switch self {
        case .artists(let artists): "\(artists.count) artist".pluralIfNeeded(artists.count)
        case .albums(let albums): "\(albums.count) album".pluralIfNeeded(albums.count)
        case .tracks(let tracks): "\(tracks.count) track".pluralIfNeeded(tracks.count)
        }
    }
    
    var count: Int {
        switch self {
        case .artists(let artists): artists.count
        case .albums(let albums): albums.count
        case .tracks(let tracks): tracks.count
        }
    }
    
}
