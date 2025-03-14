//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

@MainActor
struct ExploreListView: View {
    
    @StateObject private var viewModel = ExploreListViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                artistSection
                albumSection
                tracksSection
            }
            .padding(.vertical, Theme.size(.size200))
        }
        .clipped()
        .task {
            try? await viewModel.setup()
        }
    }
    
    @ViewBuilder
    private var artistSection: some View {
        Section {
            ArtistCarouselView(artists: viewModel.displayArtists)
        } header: {
            sectionHeader("Explore artists") {
                Button("See more") {
                    print("pressed")
                }
            }
        }
    }
    
    
    @ViewBuilder
    private var albumSection: some View {
        Section {
            ForEach(viewModel.displayAlbums, id: \.id) { album in
                AlbumView(album: album)
                    .padding(.horizontal, Theme.size(.size200))
            }
        } header: {
            HStack {
                sectionHeader("Explore albums") {
                    Button("See more") {
                        print("pressed")
                    }
                }
            }
        }
    }
    
    
    @ViewBuilder
    private var tracksSection: some View {
        Section {
            ForEach(viewModel.displayTracks, id: \.id) { track in
                TrackView(track: track)
                    .padding(.horizontal, Theme.size(.size200))
            }
        } header: {
            HStack {
                sectionHeader("Explore tracks") {
                    Button("See more") {
                        print("pressed")
                    }
                }
            }
        }
    }
    
    private func sectionHeader<Action: View>(_ title: String, @ViewBuilder action: ()->Action) -> some View {
        HStack {
            Text(title)
                .adaptiveFont(.header(.medium))
                .adaptiveForeground(.text)
            Spacer()
            action()
        }
        .padding(.bottom, Theme.size(.size200))
        .padding(.top, Theme.size(.size600))
        .padding(.horizontal, Theme.size(.size200))
        .frame(maxWidth: .infinity, alignment: .leading)
        .adaptiveBackground(.backgroundContent)
    }
}

#Preview {
    ExploreListView()
}

