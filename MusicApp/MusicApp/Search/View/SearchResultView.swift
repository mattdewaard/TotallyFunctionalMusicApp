//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import DomainKit

struct SearchResultView: View {
    
    let imageUrl: String
    let title: String
    let detail: String
    
    var body: some View {
        HStack(spacing: Theme.size(.size100)) {
            
            ImageView(url: imageUrl)
                .frame(width: Theme.size(.size500), height: Theme.size(.size500))
                .adaptiveForeground(.tint)
            
            VStack(alignment: .leading, spacing: Theme.size(.size050)) {
                Text(title)
                    .adaptiveFont(.body1(.medium))
                    .adaptiveForeground(.text)
                Text(detail)
                    .adaptiveFont(.body2)
                    .adaptiveForeground(.subtext)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(Theme.size(.size200))
        .adaptiveBackground(.backgroundContent)
    }
    
}
