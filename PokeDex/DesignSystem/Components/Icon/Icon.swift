import SwiftUI

public struct Icon: View {
    private var iconAsset: IconAsset

    public var body: some View {
        Image(iconAsset.image)
    }

    public init(_ iconAsset: IconAsset) {
        self.iconAsset = iconAsset
    }
}

#Preview {
    Icon(.pokeballFilled)
}
