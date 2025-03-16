//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct PlaybackControlsView: View {
    
    @EnvironmentObject var viewModel: PlaybackViewModel
    
    var body: some View {
        HStack(spacing: Theme.size(.size400)) {
            Spacer()
            previousButton
            playButton
            nextButton
            Spacer()
        }
    }
    
    private var playButton: some View {
        PlayButtonView(isPlaying: $viewModel.isPlaying)
            .animation(.spring(), value: viewModel.isPlaying)
            .frame(width: Theme.size(.size300), height: Theme.size(.size300))
            .onTapGesture {
                if viewModel.isPlaying {
                    viewModel.stop()
                } else {
                    viewModel.start()
                }
            }
    }
    
    private var previousButton: some View {
        Button {
            viewModel.previous()
        } label: {
            Image(systemName: "backward.end.circle")
                .resizable()
                .frame(width: Theme.size(.size300), height: Theme.size(.size300))
                .adaptiveForeground(.tint)
                .fontWeight(.medium)
        }
    }
    
    private var nextButton: some View {
        Button {
            viewModel.next()
        } label: {
            Image(systemName: "forward.end.circle")
                .resizable()
                .frame(width: Theme.size(.size300), height: Theme.size(.size300))
                .adaptiveForeground(.tint)
                .fontWeight(.medium)
        }
    }
    
}

#Preview {
    VStack {
        PlaybackControlsView()
            .environmentObject(PlaybackViewModel(duration: 221))
        Spacer()
    }
}
