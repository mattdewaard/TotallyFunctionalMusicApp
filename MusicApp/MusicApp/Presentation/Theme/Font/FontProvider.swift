//
//  Created by Matt de Waard on 24/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI
import PresentationKit

enum FontType {
    
    enum Weight {
        case regular
        case medium
        case bold
    }
    
    case entry(Weight)
    case title(Weight)
    case header(Weight)
    case body1(Weight)
    case body2(Weight)
    case body3(Weight)
    
}

extension FontType {
    
    static let entry: FontType = .entry(.bold)
    static let title: FontType = .title(.bold)
    static let header: FontType = .header(.bold)
    
    static let body1: FontType = .body1(.regular)
    static let body2: FontType = .body2(.regular)
    static let body3: FontType = .body3(.regular)
    
}

struct FontProvider: FontRepresentable {
    
    func callAsFunction(_ font: FontType) -> Font {
        Font.system(
            size: self.size(for: font),
            weight: self.weight(for: font)
        )
    }
    
    private func size(for font: FontType) -> CGFloat {
        switch font {
        case .entry: 64
        case .title: 32
        case .header: 20
        case .body1: 16
        case .body2: 14
        case .body3: 10
        }
    }
    
    private func weight(for font: FontType) -> Font.Weight {
        switch font {
        case .entry(let weight): self.weight(for: weight)
        case .title(let weight): self.weight(for: weight)
        case .header(let weight): self.weight(for: weight)
        case .body1(let weight): self.weight(for: weight)
        case .body2(let weight): self.weight(for: weight)
        case .body3(let weight): self.weight(for: weight)
        }
    }
    
    private func weight(for weight: FontType.Weight) -> Font.Weight {
        switch weight {
        case .bold: .bold
        case .medium: .medium
        case .regular: .regular
        }
    }
    
}













