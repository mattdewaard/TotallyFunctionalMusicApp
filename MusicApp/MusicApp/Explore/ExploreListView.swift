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
        LazyVStack(alignment: .leading) {
            artistSection
        }
        
        .task {
            try? await viewModel.setup()
        }
    }
    
    @ViewBuilder
    private var artistSection: some View {
        Text("Explore artists")
            .adaptiveFont(.title(.medium))
            .adaptiveForeground(.text)
        
        ForEach(viewModel.artists, id: \.name) { artist in
            Text(artist.name)
        }
    }
}

#Preview {
    ExploreListView()
}
