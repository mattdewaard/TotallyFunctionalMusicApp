//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol ExploreProtocol {
    
    associatedtype Artist: UIOArtist
    associatedtype Album: UIOAlbum
    associatedtype Track: UIOTrack
    
    func getArtists() async throws -> [Artist]
    func getAlbums() async throws -> [Album]
    func getTracks() async throws -> [Track]
    
}
