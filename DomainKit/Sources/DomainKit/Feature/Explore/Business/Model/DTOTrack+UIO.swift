//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

extension DTOTrack: UIOTrack {
    
    public var coverArtUrl: String {
        album.coverArtUrl
    }
    
    public var albumName: String {
        album.title
    }
    
    public var artistName: String {
        artist.name
    }
    
    public var id: String {
        [title, albumName, artistName].joined(separator: "_")
    }
    
    public var length: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        return formatter.string(from: Date(), to: Date().addingTimeInterval(duration)) ?? ""
    }
    
}
