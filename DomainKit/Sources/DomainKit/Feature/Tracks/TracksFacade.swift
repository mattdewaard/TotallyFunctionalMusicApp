//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class TracksFacade {
    
    func get() async throws -> [Track] {
        try await TracksUseCase().get()
    }
    
}
