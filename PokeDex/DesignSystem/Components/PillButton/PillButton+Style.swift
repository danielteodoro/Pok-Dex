import SwiftUI

extension ButtonStyle where Self == PillButtonStyle {
    static func pokemonType(buttonType: PillButton.ButtonType) -> Self {
        .init(buttonType: buttonType)
    }
}

struct PillButtonStyle: ButtonStyle {
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
        case .disabled:
            return .disabledBackgroundColor
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
        case .disabled:
            return .disabledForegroundColor
        case .allTypes:
            return .white
        case .pokemonType(pokemonType: let pokemonType):
            return pokemonType.typeForegroundColor
        }
    }
    
    var shouldDisplayBorder: Bool {
        switch buttonType {
        case .secondary:
            return true
        default:
            return false
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
            .background(
                RoundedRectangle(
                    cornerRadius: .greatestFiniteMagnitude,
                    style: .continuous
                )
                .stroke(
                    shouldDisplayBorder ? foregroundColor : .clear,
                    lineWidth: 2
                )
            )
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

#Preview {
    Button("Text", action: {})
        .buttonStyle(.pokemonType(buttonType: .primary))
    Button("Text", action: {})
        .buttonStyle(.pokemonType(buttonType: .secondary))
    Button("Text", action: {})
        .buttonStyle(.pokemonType(buttonType: .disabled))
    Button("Text", action: {})
        .buttonStyle(.pokemonType(buttonType: .pokemonType(.bug)))
}
