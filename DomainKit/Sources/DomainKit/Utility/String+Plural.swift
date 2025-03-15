//
//  DomainKit
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public extension String {
    
    func pluralIfNeeded(_ count: Int) -> String {
        count > 1 ? "\(self)s" : self
    }
    
}
