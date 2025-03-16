//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct ExplorePresentation: Hashable {
    enum Destination {
        case album
        case artist
    }
    let type: Destination
    let index: Int
}

struct ExploreListView: View {
    
    @EnvironmentObject var navigation: ContentNavigationViewModel
    @StateObject private var viewModel = ExploreListViewModel()
    
    @State private var destination: ExplorePresentation?
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                    searchIndicatorView
                    artistSection
                    Spacer(minLength: Theme.size(.size600))
                    albumSection
                    Spacer(minLength: Theme.size(.size600))
                    tracksSection
                }
                .padding(.vertical, Theme.size(.size200))
            }
            .coordinateSpace(name: "Scroll")
            .clipped()
            .scrollContentBackground(.hidden)
            .adaptiveBackground(.background)
            .task {
                try? await viewModel.setup()
            }
            .navigationDestination(item: $destination) { destination in
                switch destination.type {
                case .album:
                    let album = viewModel.displayAlbums[destination.index]
                    AlbumListView(album: album)
                case .artist:
                    let artist = viewModel.displayArtists[destination.index]
                    ArtistListView(artist: artist)
                }
            }
        }
        
    }
    
    private var searchIndicatorView: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: FramePreferenceKey.self, value: proxy.frame(in: .named("Scroll")))
        }
        .onPreferenceChange(FramePreferenceKey.self) { value in
            if value.minY > 80 && value.minY < UIScreen.main.bounds.height {
                navigation.beginSearch()
            }
        }
    }
    
    private var artistSection: some View {
        Section {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: Theme.size(.size200)), count: 2)) {
                ForEach(Array(viewModel.displayArtists.enumerated()), id: \.offset) { index, artist in
                    Button {
                        destination = .init(type: .artist, index: index)
                    } label: {
                        ArtistView(artist: artist)
                            .frame(height: 100)
                    }
                }
            }
            .padding(.horizontal, Theme.size(.size200))
            
        } header: {
            sectionHeader("Explore artists") {
                
            }
        }
    }
    
    private var albumSection: some View {
        Section {
            Divider()
            ForEach(Array(viewModel.displayAlbums.enumerated()), id: \.offset) { index, album in
                Button {
                    destination = .init(type: .album, index: index)
                } label: {
                    AlbumView(album: album)
                }
                .overlay(alignment: .bottom) {
                    Divider()
                        .padding(.horizontal, Theme.size(.size200))
                }
            }
            Divider()
        } header: {
            HStack {
                sectionHeader("Explore albums") {
                }
            }
        }
    }
    
    private var tracksSection: some View {
        Section {
            Divider()
            ForEach(viewModel.displayTracks, id: \.id) { track in
                TrackView(track: track)
            }
            Divider()
        } header: {
            HStack {
                sectionHeader("Explore tracks") {
                }
            }
        }
    }
    
    private func sectionHeader(_ title: String, action: @escaping ()->Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .adaptiveFont(.header(.medium))
                    .adaptiveForeground(.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .fontWeight(.bold)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: Theme.size(.size150))
                    .adaptiveForeground(.tint)
                    .frame(width: 40, height: 40, alignment: .trailing)
            }
            .padding(.bottom, Theme.size(.size100))
            .padding(.horizontal, Theme.size(.size200))
            .frame(maxWidth: .infinity, alignment: .leading)
            .adaptiveBackground(.background)
        }
    }
    
}

#Preview {
    ExploreListView()
        .environmentObject(ContentNavigationViewModel())
}

