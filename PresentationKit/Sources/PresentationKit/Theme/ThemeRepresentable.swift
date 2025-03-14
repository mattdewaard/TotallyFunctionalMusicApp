//
//  Created by Matt de Waard on 25/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import Foundation

public protocol ThemeRepresentable {
    
    associatedtype Palette: PaletteRepresentable
    associatedtype Color: ColorRepresentable
    associatedtype Font: FontRepresentable
    associatedtype Size: SizeRepresentable
    
    static var palette: Palette { get }
    static var color: Color { get }
    static var font: Font { get }
    static var size: Size { get }
    
}
