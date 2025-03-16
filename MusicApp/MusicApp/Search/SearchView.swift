//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct SearchView: View {
    
    @EnvironmentObject private var navigation: ContentNavigationViewModel
    @StateObject private var viewModel = SearchViewModel()
    @FocusState private var focued: Bool
    
    @State private var destination: ExplorePresentation?
    
    var body: some View {
        NavigationStack {
            VStack {
                searchBar
                ScrollView {
                    scrollContent
                }
                .animation(.linear, value: viewModel.results.map(\.count).reduce(0, +))
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background {
                Rectangle()
                    .ignoresSafeArea()
                    .adaptiveForeground(.background)
                    .transition(.opacity)
            }
            .overlay {
                if viewModel.showsEmptyState {
                    NoSearchResultsView()
                        .padding(.horizontal, Theme.size(.size600))
                        .ignoresSafeArea()
                        .transition(.opacity)
                }
            }
            .animation(.easeIn, value: viewModel.showsEmptyState)
            .task {
                try? await viewModel.setup()
            }
            .onAppear() {
                focued = true
            }
            .navigationDestination(item: $destination) { destination in
                switch destination.type {
                case .album:
                    if let album = viewModel.getAlbum(at: destination.index) {
                        AlbumListView(album: album)
                    }
                case .artist:
                    if let artist = viewModel.getArtist(at: destination.index) {
                        ArtistListView(artist: artist)
                    }
                }
            }
        }
    }
    
    
    @ViewBuilder
    private var recentsSection: some View {
        Section {
            Divider()
            ForEach(Array(viewModel.recents.enumerated()), id: \.offset) { (_, value) in
                Button {
                    navigation.play(value)
                } label: {
                    SearchResultView(
                        imageUrl: value.coverArtUrl,
                        title: value.title,
                        detail: value.artistName
                    )
                }
                .overlay(alignment: .bottom) {
                    Divider()
                        .padding(.horizontal, Theme.size(.size200))
                }
            }
        } header: {
            sectionHeader("Recents")
        }
    }
    
    private var scrollContent: some View {
        LazyVStack(alignment: .leading, spacing: 0, pinnedViews: .sectionHeaders) {
            
            if !viewModel.showsEmptyState && viewModel.results.isEmpty {
                recentsSection
            }
            
            ForEach(Array(viewModel.results.enumerated()), id: \.offset) { (_, group) in
                switch group {
                case .artists(let artists):
                    Section {
                        Divider()
                        ForEach(Array(artists.enumerated()), id: \.offset) { (index, value) in
                            Button {
                                destination = .init(type: .artist, index: index)
                            } label: {
                                SearchResultView(
                                    imageUrl: value.imageUrl,
                                    title: value.name,
                                    detail: "\(value.albums.count) albums".pluralIfNeeded(value.albums.count)
                                )
                            }
                            .overlay(alignment: .bottom) {
                                Divider()
                                    .padding(.horizontal, Theme.size(.size200))
                            }
                        }
                    } header: {
                        sectionHeader(group.title)
                    }
                case .albums(let albums):
                    Section {
                        Divider()
                        ForEach(Array(albums.enumerated()), id: \.offset) { (index, value) in
                            Button {
                                destination = .init(type: .album, index: index)
                            } label: {
                                SearchResultView(
                                    imageUrl: value.coverArtUrl,
                                    title: value.title,
                                    detail: "\(value.tracks.count) tracks".pluralIfNeeded(value.tracks.count)
                                )
                            }
                            .overlay(alignment: .bottom) {
                                Divider()
                                    .padding(.horizontal, Theme.size(.size200))
                            }
                        }
                    } header: {
                        sectionHeader(group.title)
                    }
                case .tracks(let tracks):
                    Section {
                        Divider()
                        ForEach(Array(tracks.enumerated()), id: \.offset) { (_, value) in
                            Button {
                                navigation.play(value)
                            } label: {
                                SearchResultView(
                                    imageUrl: value.coverArtUrl,
                                    title: value.title,
                                    detail: value.artistName
                                )
                            }
                            .overlay(alignment: .bottom) {
                                Divider()
                                    .padding(.horizontal, Theme.size(.size200))
                            }
                        }
                    } header: {
                        sectionHeader(group.title)
                    }
                }
                Spacer(minLength: Theme.size(.size600))
            }
            
        }
    }
    
    
    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .adaptiveFont(.header(.medium))
                .adaptiveForeground(.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(.bottom, Theme.size(.size100))
        .padding(.horizontal, Theme.size(.size200))
        .frame(maxWidth: .infinity, alignment: .leading)
        .adaptiveBackground(.background)
    }
    
    @ViewBuilder
    private var searchBar: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .adaptiveForeground(.subtext)
                
                TextField("Search for a song, artist or album", text: $viewModel.searchTerm)
                    .focused($focued)
                    .adaptiveFont(.body1)
                    .adaptiveForeground(.text)
                    .submitLabel(.search)
                    .onSubmit { [viewModel] in
                        viewModel.search()
                    }
            }
            .padding(Theme.size(.size200))
            .adaptiveBackground(.backgroundContent)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.1), radius: 16, x: 0, y: 0)
        }
        .padding(Theme.size(.size200))
        .transition(.offset(y: 50).combined(with: .opacity))
    }
    
}

#Preview {
    SearchView()
        .environmentObject(ContentNavigationViewModel())
}
