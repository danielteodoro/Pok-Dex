import SwiftUI

public enum IconAsset {
    // Custom Icons
    case pokeballOutline
    case pokeballFilled
    case pokeRegionOutline
    case pokeRegionFilled
    case favoritesOutline
    case favoritesFilled
    case chevronDown
    case chevronUp
    case chevronLeft
    case chevronRight

    var image: ImageResource {
        switch self {
        case .pokeballOutline: return ImageResource(name: "pokeball-outline", bundle: .main)
        case .pokeballFilled: return ImageResource(name: "pokeball-filled", bundle: .main)
        case .pokeRegionOutline: return ImageResource(name: "poke-region-outline", bundle: .main)
        case .pokeRegionFilled: return ImageResource(name: "poke-region-filled", bundle: .main)
        case .favoritesOutline: return ImageResource(name: "favorites-outline", bundle: .main)
        case .favoritesFilled: return ImageResource(name: "favorites-filled", bundle: .main)
        case .chevronDown: return ImageResource(name: "chevron.down", bundle: .main)
        case .chevronUp: return ImageResource(name: "chevron.up", bundle: .main)
        case .chevronLeft: return ImageResource(name: "chevron.left", bundle: .main)
        case .chevronRight: return ImageResource(name: "chevron.right", bundle: .main)
        }
    }
}
