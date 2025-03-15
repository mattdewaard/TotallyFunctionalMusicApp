//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class RecentsRepository {
    
    private let storage: UserDefaults = .standard
    private let recentsKey: String = "recent_tracks"
   
    func store(_ trackIds: [String]) throws {
        let data = try JSONEncoder().encode(trackIds)
        storage.set(data, forKey: recentsKey)
    }
    
    func get() throws -> [String] {
        guard let data = storage.data(forKey: recentsKey) else {
            return []
        }
        return try JSONDecoder().decode([String].self, from: data)
    }
    
}
