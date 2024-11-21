import SwiftUI

public enum IconAsset {
    case pokeballOutline
    case pokeballFilled
    case pokeRegionOutline
    case pokeRegionFilled
    case favoritesOutline
    case favoritesFilled

    var image: ImageResource {
        switch self {
        case .pokeballOutline: return ImageResource(name: "pokeball-outline", bundle: .main)
        case .pokeballFilled: return ImageResource(name: "pokeball-filled", bundle: .main)
        case .pokeRegionOutline: return ImageResource(name: "poke-region-outline", bundle: .main)
        case .pokeRegionFilled: return ImageResource(name: "poke-region-filled", bundle: .main)
        case .favoritesOutline: return ImageResource(name: "favorites-outline", bundle: .main)
        case .favoritesFilled: return ImageResource(name: "favorites-filled", bundle: .main)
        }
    }
}
