//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct ExploreListView: View {
    
    @StateObject private var viewModel = ExploreListViewModel()
    @Binding var showSearchInterface: Bool
    
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
            .adaptiveBackground(.backgroundContent)
            .task {
                try? await viewModel.setup()
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
                showSearchInterface = true
            }
        }
    }
    
    private var artistSection: some View {
        Section {
            ArtistCarouselView(artists: viewModel.displayArtists)
        } header: {
            sectionHeader("Explore artists") {
                
            }
        }
    }
    
    private var albumSection: some View {
        Section {
            Divider()
            ForEach(viewModel.displayAlbums, id: \.id) { album in
                AlbumView(album: album)
                    .padding(.horizontal, Theme.size(.size200))
            }
            Divider()
        } header: {
            HStack {
                sectionHeader("Explore albums") {
                    print("pressed")
                }
            }
        }
    }
    
    private var tracksSection: some View {
        Section {
            Divider()
            ForEach(viewModel.displayTracks, id: \.id) { track in
                TrackView(track: track)
                    .padding(.horizontal, Theme.size(.size200))
            }
            Divider()
        } header: {
            HStack {
                sectionHeader("Explore tracks") {
                    print("pressed")
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
            .adaptiveBackground(.backgroundContent)
        }
    }
}

#Preview {
    ExploreListView(showSearchInterface: .constant(false))
}

