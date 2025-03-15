//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation
import DomainKit

final class SearchViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    
    private let usecase: any SearchProtocol
    
    init(usecase: any SearchProtocol = DomainKitFacade.search) {
        self.usecase = usecase
    }
    
}
