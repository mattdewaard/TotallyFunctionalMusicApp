//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class FavouritesRepository {
    
    private let storage: UserDefaults = .standard
    private let favouritesKey: String = "favourite_tracks"
    
    func add(_ trackId: String) throws {
        var tracks = try get()
        tracks.append(trackId)
        try store(tracks)
    }
    
    func remove(_ trackId: String) throws {
        var tracks = try get()
        tracks = tracks.filter { $0 != trackId }
        try store(tracks)
    }
    
    func get() throws -> [String] {
        guard let data = storage.data(forKey: favouritesKey) else {
            return []
        }
        return try JSONDecoder().decode([String].self, from: data)
    }
    
}

extension FavouritesRepository {

    
    private func store(_ tracks: [String]) throws {
        let data = try JSONEncoder().encode(tracks)
        storage.set(data, forKey: favouritesKey)
    }
    
}
