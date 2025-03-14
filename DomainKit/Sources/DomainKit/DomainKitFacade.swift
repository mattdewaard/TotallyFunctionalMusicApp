//
//  DomainKit
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

public final class DomainKitFacade {
    
    public static var explore: any ExploreProtocol {
        ExploreFacade()
    }
    
    public static var search: any SearchProtocol {
        SearchFacade()
    }
    
}
