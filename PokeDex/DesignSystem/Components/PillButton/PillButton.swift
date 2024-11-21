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
        .buttonStyle(PillButtonStyle(buttonType: contentModel.buttonType))
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




#Preview {
    let dragonButtonContent: PillButton.ContentModel = .init(
        title: "Fire",
        buttonType: .pokemonType(.fire),
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
