import SwiftUI

public struct PillButton: View, ContentConfigurable {
    typealias ButtonAction = (() -> Void)
    
    var contentModel: ContentModel
    var action: ButtonAction?
    
    public var body: some View {
        Button {
            action?()
        }
        label: {
            HStack(alignment: .center, spacing: Spacing.xSmall) {
                Text(contentModel.title)
                    .frame(maxWidth: .infinity)
                    
                if contentModel.shouldPresentChevron {
                    Image(systemName: "chevron.down")
                }
            }
        }
        .buttonStyle(PokemonTypeButtonStyle(buttonType: contentModel.buttonType))
    }
    
    init(
        contentModel: ContentModel,
        action: (() -> Void)? = nil
    ) {
        self.contentModel = contentModel
        self.action = action
    }
    
    mutating func action(_ action: @escaping ButtonAction) -> Self {
        self.action = action
        
        return self
    }
}

struct PokemonTypeButtonStyle: ButtonStyle {
    enum Constants {
        static let minWidth: CGFloat = 156
        static let scaleEffectMin: CGFloat = 0.9
        static let scaleEffectDuration: CGFloat = 0.15
    }
    
    var buttonType: PillButton.ButtonType
    
    var backgroundColor: Color {
        switch buttonType {
        case .primary:
            return .blueTintColor
        case .secondary:
            return .clear
        case .allTypes:
            return .allTypesBackgroundColor
        case .pokemonType(pokemonType: let pokemonType):
            return pokemonType.typeBackgroundColor
        }
    }
    
    var foregroundColor: Color {
        switch buttonType {
        case .primary:
            return .white
        case .secondary:
            return .blueTintColor
        case .allTypes:
            return .white
        case .pokemonType(pokemonType: let pokemonType):
            return pokemonType.typeForegroundColor
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: Constants.minWidth)
            .font(.semiBoldMedium)
            .padding(.vertical, Spacing.small)
            .padding(.horizontal, Spacing.large)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .buttonStyle(.borderedProminent)
            .clipShape(.capsule)
            .scaleEffect(
                configuration.isPressed ? Constants.scaleEffectMin : 1
            )
            .animation(
                .easeOut(
                    duration: Constants.scaleEffectDuration
                ),
                value: configuration.isPressed
            )
    }
}

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
        case allTypes
        case pokemonType(_ pokemonType: PokemonType)
    }
}

#Preview {
    let dragonButtonContent: PillButton.ContentModel = .init(
        title: "Dragon",
        buttonType: .pokemonType(.dragon),
        shouldPresentChevron: true
    )
    
    VStack {
        HStack(alignment: .center) {
            Spacer()
                .frame(width: 100)
            VStack(alignment: .center) {
                PillButton(
                    contentModel: .init(
                        title: "Primary",
                        buttonType: .primary,
                        shouldPresentChevron: false
                    )
                ) {
                    print("Taped primary")
                }
                
                PillButton(
                    contentModel: .init(
                        title: "Secondary",
                        buttonType: .secondary
                    )
                ) {
                    print("Taped secondary")
                }
                
                PillButton(
                    contentModel: .init(
                        title: "All types",
                        buttonType: .allTypes,
                        shouldPresentChevron: true
                    )
                ) {
                    print("Taped all types")
                }
                
                PillButton(contentModel: dragonButtonContent)
                    {
                        dragonButtonContent.buttonType = .allTypes
                        dragonButtonContent.shouldPresentChevron = false
                        dragonButtonContent.title = "All types"
                    }
                
                PillButton(contentModel: .init(title: "Water", buttonType: .pokemonType(.water))) {
                    print("Taped water")
                }
            }
            Spacer()
                .frame(width: 100)
        }

    }
}
