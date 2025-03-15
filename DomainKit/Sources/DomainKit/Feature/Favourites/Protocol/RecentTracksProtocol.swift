//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol RecentTracksProtocol {
    
    associatedtype Track: UIOTrack
    
    func getRecents() async throws -> [Track]
    func addRecent(_ trackId: String) async throws
    
}
