//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @FocusState private var focued: Bool
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
           searchBar
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background {
            Rectangle()
                .ignoresSafeArea()
                .adaptiveForeground(.backgroundContent)
                .transition(.opacity)
        }
        .onAppear() {
            focued = true
        }
        .onChange(of: focued) { _ in
            if !focued && viewModel.searchTerm.isEmpty {
                isPresented = false
            }
        }
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
                
                Image(systemName: "xmark")
                    .adaptiveForeground(.tint)
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
    SearchView(isPresented: .constant(true))
}
