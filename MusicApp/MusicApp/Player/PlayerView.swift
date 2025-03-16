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
            
            contentView
            
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
        }
        .padding(.horizontal, Theme.size(.size300))
        .padding(.top, Theme.size(.size300))
    }
    
    private var contentView: some View {
        VStack(spacing: 0) {
            ImageView(url: viewModel.track.coverArtUrl)
                .frame(width: 300, height: 300)
                .padding(.bottom, Theme.size(.size300))
            optionsView
                .padding(.bottom, Theme.size(.size300))
            
            Text(viewModel.track.title)
                .adaptiveFont(.header(.medium))
                .padding(.bottom, Theme.size(.size100))
            Text(viewModel.track.artistName)
                .adaptiveFont(.body1)
                .padding(.bottom, Theme.size(.size100))
            Text(viewModel.track.albumName)
                .adaptiveFont(.body1)
        }
        .padding(.horizontal, Theme.size(.size200))
    }
    
    private var optionsView: some View {
        HStack(spacing: Theme.size(.size300)) {
            Button {
                Task {
                    try? await viewModel.toggleFavourite()
                }
            } label: {
                Image(systemName: viewModel.isFavourite ? "star.fill" : "star")
                    .adaptiveForeground(.tint)
                    .fontWeight(.bold)
            }
            Button {
            
            } label: {
                Image(systemName: "plus.circle")
                    .frame(width: Theme.size(.size300), height: Theme.size(.size300))
                    .adaptiveForeground(.tint)
                    .fontWeight(.bold)
            }
            Button {
            
            } label: {
                Image(systemName: "minus.circle")
                    .frame(width: Theme.size(.size300), height: Theme.size(.size300))
                    .adaptiveForeground(.tint)
                    .fontWeight(.bold)
            }
            
            Button {
            
            } label: {
                Image(systemName: "ellipsis.circle")
                    .frame(width: Theme.size(.size300), height: Theme.size(.size300))
                    .adaptiveForeground(.tint)
                    .fontWeight(.bold)
            }
        }
    }
    
}
