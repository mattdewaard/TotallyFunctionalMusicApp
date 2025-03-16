//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol TracksProtocol {
    
    associatedtype Track: UIOTrack
    
    func getTrack(id: String) async throws -> Track
    
}
