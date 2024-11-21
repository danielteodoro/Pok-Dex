import Foundation
import SwiftUI

public enum PokemonType: String, Codable {
    case bug
    case dark
    case dragon
    case eletric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water

    // MARK: - Colors

    var typeBackgroundColor: Color {
        switch self {
        case .bug: return .bugTypeColor
        case .dark: return .darkTypeColor
        case .dragon: return .dragonTypeColor
        case .eletric: return .electricTypeColor
        case .fairy: return .fairyTypeColor
        case .fighting: return .fightingTypeColor
        case .fire: return .fireTypeColor
        case .flying: return .flyingTypeColor
        case .ghost: return .ghostTypeColor
        case .grass: return .grassTypeColor
        case .ground: return .groundTypeColor
        case .ice: return .iceTypeColor
        case .normal: return .normalTypeColor
        case .poison: return .poisonTypeColor
        case .psychic: return .psychicTypeColor
        case .rock: return .rockTypeColor
        case .steel: return .steelTypeColor
        case .water: return .waterTypeColor
        }
    }

    var typeForegroundColor: Color {
        switch self {
        case .bug: return .black
        case .dark: return .white
        case .dragon: return .white
        case .eletric: return .black
        case .fairy: return .black
        case .fighting: return .white
        case .fire: return .black
        case .flying: return .black
        case .ghost: return .white
        case .grass: return .black
        case .ground: return .black
        case .ice: return .black
        case .normal: return .black
        case .poison: return .black
        case .psychic: return .black
        case .rock: return .black
        case .steel: return .black
        case .water: return .black
        }
    }
}
