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
    @Published private(set) var results: [UIOSearchResult] = []
    @Published private(set) var recents: [any UIOTrack] = []
    
    private let searchUsecase: any SearchProtocol
    private let recentUsecase: any RecentTracksProtocol
    
    init(searchUsecase: any SearchProtocol = DomainKitFacade.search,
         recentUsecase: any RecentTracksProtocol = DomainKitFacade.favourite) {
        self.searchUsecase = searchUsecase
        self.recentUsecase = recentUsecase
    }
    
    func setup() async throws {
        let recents = try await recentUsecase.getRecents()
        self.recents = recents
    }
    
    func search() {
        Task {
            let term = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !term.isEmpty else {
                self.searchTerm = ""
                return
            }
            let results = try await searchUsecase.search(by: term)
            self.results = results
            self.showsEmptyState = results.isEmpty
        }
    }
    
    func getArtist(at index: Int) -> (any UIOArtist)? {
        for result in results {
            if case .artists(let array) = result {
                return array[index]
            }
        }
        return nil
    }
    
    func getAlbum(at index: Int) -> (any UIOAlbum)? {
        for result in results {
            if case .albums(let array) = result {
                return array[index]
            }
        }
        return nil
    }
    
}
