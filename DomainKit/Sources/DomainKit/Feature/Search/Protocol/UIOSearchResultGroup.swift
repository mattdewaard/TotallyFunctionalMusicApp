//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public protocol UIOSearchResultGroup {
    
    associatedtype Result = UIOSearchResult
    
    var title: String { get }
    var results: [Result] { get }
    
}
