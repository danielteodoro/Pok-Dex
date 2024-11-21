import SwiftUI

extension Color {

    init(hex: Int, opacity: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: opacity
            )
        }

    // UI Colors
    static var blueTintColor: Color = .init(hex: 0x173EA5)

    static var disabledBackgroundColor: Color = .init(hex: 0xE6E6E6)

    static var disabledForegroundColor: Color = .init(hex: 0x999999)

    static var allTypesBackgroundColor: Color = .init(hex: 0x333333)

    // Type colors
    static var bugTypeColor: Color = .init(hex: 0x91C12F)

    static var darkTypeColor: Color = .init(hex: 0x5A5465)

    static var dragonTypeColor: Color = .init(hex: 0x0B6DC3)

    static var electricTypeColor: Color = .init(hex: 0xF4D23C)

    static var fairyTypeColor: Color = .init(hex: 0xEC8FE6)

    static var fightingTypeColor: Color = .init(hex: 0xCE416B)

    static var fireTypeColor: Color = .init(hex: 0xFF9D55)

    static var flyingTypeColor: Color = .init(hex: 0x89AAE3)

    static var ghostTypeColor: Color = .init(hex: 0x5269AD)

    static var grassTypeColor: Color = .init(hex: 0x63BC5A)

    static var groundTypeColor: Color = .init(hex: 0xD97845)

    static var iceTypeColor: Color = .init(hex: 0x73CEC0)

    static var steelTypeColor: Color = .init(hex: 0x5A8EA2)

    static var normalTypeColor: Color = .init(hex: 0x919AA2)

    static var poisonTypeColor: Color = .init(hex: 0xB567CE)

    static var psychicTypeColor: Color = .init(hex: 0xFA7179)

    static var rockTypeColor: Color = .init(hex: 0xC5B78C)

    static var waterTypeColor: Color = .init(hex: 0x5090D6)
}
