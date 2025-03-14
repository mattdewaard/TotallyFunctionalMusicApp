//
//  Created by Matt de Waard on 24/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import Foundation
import PresentationKit

struct Theme: ThemeRepresentable {
    
    static var palette: PaletteProvider { PaletteProvider() }
    static var color: ColorProvider { ColorProvider() }
    static var font: FontProvider { FontProvider() }
    static var size: SizeProvider { SizeProvider() }
    
}
