//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct AlbumListView: View {
    
    let album: any UIOAlbum
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                
                ForEach(album.tracks, id: \.id) { track in
                    TrackView(track: track)
                }
                
            }
        }
        .navigationTitle(album.title)
    }
    
}
