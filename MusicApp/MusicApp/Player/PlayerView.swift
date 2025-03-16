//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct PlayerView: View {
    
    @StateObject private var viewModel: PlayerViewModel
    @StateObject private var player: PlaybackViewModel
    
    init(track: UIOTrack) {
        _viewModel = StateObject(wrappedValue: PlayerViewModel(track: track))
        _player = StateObject(wrappedValue: PlaybackViewModel(duration: track.duration))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            ImageView(url: viewModel.track.coverArtUrl)
                .frame(width: 300, height: 300)
                .padding(.bottom, Theme.size(.size600))
            Text(viewModel.track.title)
                .adaptiveFont(.header(.medium))
                .padding(.bottom, Theme.size(.size100))
            Text(viewModel.track.artistName)
                .adaptiveFont(.body1)
                .padding(.bottom, Theme.size(.size100))
            Text(viewModel.track.albumName)
                .adaptiveFont(.body1)
            
            
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            PlayerControlView()
                .padding(.horizontal, Theme.size(.size300))
                .padding(.bottom, Theme.size(.size300))
        }
        .safeAreaInset(edge: .top) {
            navigationBar
        }
        .environmentObject(player)
        .task {
            try? await viewModel.loadTrack()
        }
    }
    
    private var navigationBar: some View {
        HStack {
            Image(systemName: "chevron.down")
                .adaptiveForeground(.tint)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.horizontal, Theme.size(.size300))
        .padding(.top, Theme.size(.size300))
    }
    
}

#Preview {
    PlayerContainerView(trackId: "Bohemian Rhapsody_A Night at the Opera_Queen")
}
