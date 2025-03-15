//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation
import DomainKit

@MainActor
final class SearchViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var showsEmptyState: Bool = false
    @Published private(set) var results: [any UIOSearchResultGroup] = []
    
    private let usecase: any SearchProtocol
    
    init(usecase: any SearchProtocol = DomainKitFacade.search) {
        self.usecase = usecase
    }
    
    func search() {
        Task {
            let term = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !term.isEmpty else {
                self.searchTerm = ""
                return
            }
            let results = try await usecase.search(by: term)
            self.results = results
            self.showsEmptyState = results.isEmpty
        }
    }
}
