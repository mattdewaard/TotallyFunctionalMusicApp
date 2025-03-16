//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public struct DTOTrack: Codable, Sendable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
        case album
        case genre
        case duration
        case releaseDateString = "releaseDate"
        case trackNumber
        case tags
    }
    
    public let title: String
    public let artist: Artist
    public let album: Album
    public let genre: String
    public let duration: TimeInterval
    public let trackNumber: Int
    public let tags: [String]
    let releaseDateString: String
    
}

extension DTOTrack {
    
    var releaseDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.date(from: releaseDateString) ?? .distantPast
    }
    
}

