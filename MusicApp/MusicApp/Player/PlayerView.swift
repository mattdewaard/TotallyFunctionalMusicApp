//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct PlayerView: View {
    
    @EnvironmentObject private var navigation: ContentNavigationViewModel
    @StateObject private var viewModel: PlayerViewModel
    @StateObject private var player: PlaybackViewModel
    
    init(track: UIOTrack) {
        _viewModel = StateObject(wrappedValue: PlayerViewModel(track: track))
        _player = StateObject(wrappedValue: PlaybackViewModel(duration: track.duration))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            navigationBar
            
            Spacer()
            
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
            
            Spacer()
            
            PlayerControlView()
                .padding(.horizontal, Theme.size(.size300))
                .padding(.bottom, Theme.size(.size300))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .adaptiveForeground(.backgroundContent)
                .ignoresSafeArea()
        }
        .environmentObject(player)
        .task {
            try? await viewModel.loadTrack()
        }
        .onAppear() {
            player.start()
        }
        .modifier(DismissGesture(cornerRadius: 32, threshold: 300, onDismiss: {
            navigation.dismissPlayer()
        }))
    }
    
    private var navigationBar: some View {
        HStack {
            Button {
                navigation.dismissPlayer()
            } label: {
                Image(systemName: "chevron.down")
                    .adaptiveForeground(.tint)
                    .fontWeight(.bold)
            }
            Spacer()
            Button {
                Task {
                    try? await viewModel.toggleFavourite()
                }
            } label: {
                Image(systemName: viewModel.isFavourite ? "star.fill" : "star")
                    .adaptiveForeground(.tint)
                    .fontWeight(.bold)
            }
        }
        .padding(.horizontal, Theme.size(.size300))
        .padding(.top, Theme.size(.size300))
    }
    
}
