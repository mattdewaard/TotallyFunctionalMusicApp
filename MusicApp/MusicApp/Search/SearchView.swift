//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit
struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @FocusState private var focued: Bool
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            searchBar
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: .sectionHeaders) {
                    ForEach(Array(viewModel.results.enumerated()), id: \.offset) { (_, group) in
                        resultsSection(from: group)
                        Spacer(minLength: Theme.size(.size600))
                    }
                    
                }
            }
            .animation(.linear, value: viewModel.results.flatMap(\.results).count)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background {
            Rectangle()
                .ignoresSafeArea()
                .adaptiveForeground(.backgroundContent)
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
    private func resultsSection(from group: any UIOSearchResultGroup) -> some View {
        Section {
            Divider()
            ForEach(Array(group.results.enumerated()), id: \.offset) { (_, result) in
                SearchResultView(result: result)
                    
            }
        } header: {
            HStack {
                Text(group.title)
                    .adaptiveFont(.header(.medium))
                    .adaptiveForeground(.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(.bottom, Theme.size(.size100))
            .padding(.horizontal, Theme.size(.size200))
            .frame(maxWidth: .infinity, alignment: .leading)
            .adaptiveBackground(.backgroundContent)
        }
        .transition(.asymmetric(
            insertion: .offset(y: 20),
            removal: .opacity)
        )
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
                
                Button {
                    viewModel.searchTerm = ""
                    isPresented = false
                } label: {
                    Image(systemName: "xmark")
                        .adaptiveForeground(.tint)
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
    SearchView(isPresented: .constant(true))
}
