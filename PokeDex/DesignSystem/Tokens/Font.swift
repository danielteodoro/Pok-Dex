import SwiftUI

public extension Font {
    // MARK: - Medium
    static var mediumFont: String { "Poppins-Medium" }
    
    /// size: 10
    /// weight: medium
    static var mediumXSmall: Font { .custom(mediumFont, size: Sizes.xSmall) }
    
    /// size: 12
    /// weight: medium
    static var mediumSmall: Font { .custom(mediumFont, size: Sizes.small) }
    
    /// size: 14
    /// weight: medium
    static var mediumMedium: Font { .custom(mediumFont, size: Sizes.medium) }
    
    /// size: 16
    /// weight: medium
    static var mediumLarge: Font { .custom(mediumFont, size: Sizes.large) }
    
    /// size: 20
    /// weight: medium
    static var mediumXLarge: Font { .custom(mediumFont, size: Sizes.xLarge) }
    
    // MARK: - SemiBold
    static var semiBoldFont: String { "Poppins-SemiBold" }
    
    /// size: 10
    /// weight: semiBold
    static var semiBoldXSmall: Font { .custom(semiBoldFont, size: Sizes.xSmall) }
    
    /// size: 12
    /// weight: semiBold
    static var semiBoldSmall: Font { .custom(semiBoldFont, size: Sizes.small) }
    
    /// size: 14
    /// weight: semiBold
    static var semiBoldMedium: Font { .custom(semiBoldFont, size: Sizes.medium) }
    
    /// size: 16
    /// weight: semiBold
    static var semiBoldLarge: Font { .custom(semiBoldFont, size: Sizes.large) }
    
    /// size: 20
    /// weight: semiBold
    static var semiBoldXLarge: Font { .custom(semiBoldFont, size: Sizes.xLarge) }
    
    // MARK: - Bold
    static var boldFont: String { "Poppins-Bold" }
    
    /// size: 10
    /// weight: bold
    static var boldXSmall: Font { .custom(boldFont, size: Sizes.xSmall) }
    
    /// size: 12
    /// weight: bold
    static var boldSmall: Font { .custom(boldFont, size: Sizes.small) }
    
    /// size: 14
    /// weight: bold
    static var boldMedium: Font { .custom(boldFont, size: Sizes.medium) }
    
    /// size: 16
    /// weight: bold
    static var boldLarge: Font { .custom(boldFont, size: Sizes.large) }
    
    /// size: 20
    /// weight: bold
    static var boldXLarge: Font { .custom(boldFont, size: Sizes.xLarge) }
    
    // MARK: - Extra Bold
    static var extraBoldFont: String { "Poppins-ExtraBold" }
    
    /// size: 10
    /// weight: Extra Bold
    static var extraBoldXSmall: Font { .custom(extraBoldFont, size: Sizes.xSmall) }
    
    /// size: 12
    /// weight: Extra Bold
    static var extraBoldSmall: Font { .custom(extraBoldFont, size: Sizes.small) }
    
    /// size: 14
    /// weight: Extra Bold
    static var extraBoldMedium: Font { .custom(extraBoldFont, size: Sizes.medium) }
    
    /// size: 16
    /// weight: Extra Bold
    static var extraBoldLarge: Font { .custom(extraBoldFont, size: Sizes.large) }
    
    /// size: 20
    /// weight: Extra Bold
    static var extraBoldXLarge: Font { .custom(extraBoldFont, size: Sizes.xLarge) }
}
