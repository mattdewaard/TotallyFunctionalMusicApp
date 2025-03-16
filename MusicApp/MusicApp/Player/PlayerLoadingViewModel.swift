//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation
import DomainKit

@MainActor
final class PlayerLoadingViewModel: ObservableObject {
    
    @Published private(set) var track: UIOTrack?
    
    private let trackId: String
    private let tracksUsecase: any TracksProtocol
    
    init(trackId: String,
         tracksUsecase: any TracksProtocol = DomainKitFacade.tracks) {
        self.trackId = trackId
        self.tracksUsecase = tracksUsecase
    }
    
    func loadTrack() async throws {
        track = try await tracksUsecase.getTrack(id: trackId)
    }
    
}
