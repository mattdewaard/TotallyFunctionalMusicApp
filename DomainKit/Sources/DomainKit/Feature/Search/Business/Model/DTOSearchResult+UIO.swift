//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOSearchResult: UIOSearchResultGroup {
    
    var title: String {
        let count = results.count
        return switch self {
        case .albums: "\(count) album".pluralIfNeeded(count)
        case .artists: "\(count) artist".pluralIfNeeded(count)
        case .tracks: "\(count) track".pluralIfNeeded(count)
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
