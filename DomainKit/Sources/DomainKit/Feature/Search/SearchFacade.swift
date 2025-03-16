//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

final class SearchFacade: SearchProtocol {
    
    func search(by term: String) async throws -> [UIOSearchResult] {
        try await SearchUseCase().search(by: term)
    }
    
}
