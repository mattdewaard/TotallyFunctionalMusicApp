//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol SearchProtocol {
    
    associatedtype SearchResult: UIOSearchResultGroup
    
    func search(by term: String) async throws -> [SearchResult]
    
}
