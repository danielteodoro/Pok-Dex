import SwiftUI

public struct PillButton: View, ContentConfigurable {
    typealias ButtonAction = (() -> Void)

    private var contentModel: ContentModel
    var action: ButtonAction?
    @State private var shouldAnimateChevron: Bool = false

    public var body: some View {
        Button {
            action?()
            
            // Chevron animation control
            shouldAnimateChevron = true
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                shouldAnimateChevron = false
            }
        }
        label: {
            HStack(alignment: .center, spacing: Spacing.xSmall) {
                Text(contentModel.title)
                    .frame(maxWidth: .infinity)

                if contentModel.shouldPresentChevron {
                    Image(systemName: "chevron.down")
                        .symbolEffect(.wiggle.down, options: .repeat(1), isActive: shouldAnimateChevron)
                }
            }
        }
        .buttonStyle(.pokemonType(buttonType: contentModel.buttonType))
    }

    init(
        contentModel: ContentModel,
        action: (() -> Void)? = nil
    ) {
        self.contentModel = contentModel
        self.action = action
    }
}

#Preview {
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
                )

                PillButton(
                    contentModel: .init(
                        title: "Secondary",
                        buttonType: .secondary
                    )
                )

                PillButton(
                    contentModel: .init(
                        title: "Disabled",
                        buttonType: .disabled
                    )
                )

                PillButton(
                    contentModel: .init(
                        title: "All types",
                        buttonType: .allTypes,
                        shouldPresentChevron: true
                    )
                )

                PillButton(
                    contentModel: .init(
                        title: "Fire",
                        buttonType: .pokemonType(.fire)
                    )
                )

                PillButton(
                    contentModel: .init(
                        title: "Water",
                        buttonType: .pokemonType(.water)
                    )
                )

                PillButton(
                    contentModel: .init(
                        title: "Grass",
                        buttonType: .pokemonType(.grass)
                    )
                )
            }
            Spacer()
                .frame(width: 100)
        }

    }
}
