//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct PlayerControlView: View {
    
    var body: some View {
        VStack(spacing: Theme.size(.size400)) {
            PlaybackProgressView()
            PlaybackControlsView()
        }
        .padding(.vertical, Theme.size(.size200))
        .adaptiveBackground(.backgroundContent)
        .clipShape(RoundedRectangle(cornerRadius: Theme.size(.size200)))
        .shadow(color: Color.black.opacity(0.1), radius: 16, x: 0, y: 0)
    }
    
}

#Preview {
    VStack() {
        PlayerControlView()
        Spacer()
    }
    .environmentObject(PlaybackViewModel(duration: 221))
}
