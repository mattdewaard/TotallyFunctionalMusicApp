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
            ArtistCarouselView(artists: viewModel.artists)
        } header: {
            sectionHeader("Explore artists")
        }
    }
    
    
    @ViewBuilder
    private var albumSection: some View {
        Section {
            ForEach(viewModel.albums, id: \.id) { album in
                AlbumView(album: album)
                    .padding(.horizontal, Theme.size(.size200))
            }
        } header: {
            sectionHeader("Explore albums")
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .adaptiveFont(.header(.medium))
            .adaptiveForeground(.text)
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

