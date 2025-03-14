//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOSearchResult: UIOSearchResultGroup {
    
    var title: String {
        switch self {
        case .albums: "Albums"
        case .artists: "Artists"
        case .tracks: "Tracks"
        }
    }
    
    var results: [UIOSearchResult] {
        switch self {
        case .albums(let albums): albums
        case .artists(let artists): artists
        case .tracks(let tracks): tracks
        }
    }
    
}
