//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class RecentsUseCase {
    
    func add(_ trackId: String) throws {
        var recents = try RecentsRepository().get()
        recents.insert(trackId, at: 0)
        try RecentsRepository().store(Array(recents.prefix(10)))
    }

    func get() async throws -> [DTOTrack] {
        let recentIds = try RecentsRepository().get()
        let tracks = try await TracksFacade().get()
        return tracks.filter { recentIds.contains($0.trackId) }
    }
    
}
