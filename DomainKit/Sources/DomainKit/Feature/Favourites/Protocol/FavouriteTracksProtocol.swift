//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol FavouriteTracksProtocol {
    
    associatedtype Track: UIOTrack
    
    func getFavourites() async throws -> [Track]
    func isFavourite(_ trackId: String) async throws -> Bool
    func addFavourite(_ trackId: String) async throws
    func removeFavourite(_ trackId: String) async throws
    
}
