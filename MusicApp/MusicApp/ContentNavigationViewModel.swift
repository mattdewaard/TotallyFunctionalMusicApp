//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

final class ContentNavigationViewModel: ObservableObject {
    
    @Published private(set) var showSearchInterface: Bool = false
    @Published private(set) var track: UIOTrack?
    
    @Published private(set) var showTrackAsFocused: Bool = false
    
    func play(_ track: UIOTrack, focused: Bool = true) {
        showTrackAsFocused = focused
        self.track = track
    }
    
    func dismissPlayer() {
        showTrackAsFocused = false
    }
    
    func closePlayer() {
        track = nil
    }
    
    func beginSearch() {
        showSearchInterface = true
    }
    
    func dismissSearch() {
        showSearchInterface = false
    }
    
}
