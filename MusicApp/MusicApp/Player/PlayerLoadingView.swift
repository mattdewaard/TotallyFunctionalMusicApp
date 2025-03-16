//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct PlayerContainerView: View {
    
    @StateObject private var viewModel: PlayerLoadingViewModel
    
    init(trackId: String) {
        _viewModel = StateObject(wrappedValue: PlayerLoadingViewModel(trackId: trackId))
    }
    
    var body: some View {
        ZStack {
            if let track = viewModel.track {
                PlayerView(track: track)
            }
        }
        .task {
            try? await viewModel.loadTrack()
        }
    }
}

#Preview {
    PlayerContainerView(trackId: "Bohemian Rhapsody_A Night at the Opera_Queen")
}
