//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class TracksUseCase {
    
    func get() async throws -> [DTOTrack] {
        guard let jsonUrl = Bundle.module.url(forResource: "songs", withExtension: "json") else {
            throw TrackError.trackJsonNotFound
        }
        let jsonData = try Data(contentsOf: jsonUrl)
        let tracks = try JSONDecoder().decode([DTOTrack].self, from: jsonData)
        return tracks
    }
    
}
