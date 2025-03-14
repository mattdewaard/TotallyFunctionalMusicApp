//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class ExploreTracksUseCase {
    
    func get() async throws -> [DTOTrack] {
        try await TracksFacade().get()
    }
    
}
