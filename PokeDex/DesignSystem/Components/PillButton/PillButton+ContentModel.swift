import Observation

public extension PillButton {
    @Observable
    class ContentModel {
        var title: String
        var buttonType: ButtonType
        var shouldPresentChevron: Bool

        init(
            title: String,
            buttonType: ButtonType,
            shouldPresentChevron: Bool = false
        ) {
            self.title = title
            self.buttonType = buttonType
            self.shouldPresentChevron = shouldPresentChevron
        }
    }

    enum ButtonType: Hashable {
        case primary
        case secondary
        case disabled
        case allTypes
        case pokemonType(_ pokemonType: PokemonType)
    }
}
