import UIKit

/**
 A wrapper around UIContentSize. Maps 1:1 to the corresponding UIContentSize while allowing for nicer notation.
*/
public enum TypesetterFontSize: String {
    /** An extra small font. */
    case ExtraSmall
    /** A small font. */
    case Small
    /** A medium-sized font. */
    case Medium
    /** A large font. */
    case Large
    /** An extra large font. */
    case ExtraLarge
    /** An increasingly large font. */
    case ExtraExtraLarge
    /** The largest font option. */
    case ExtraExtraExtraLarge
    /** A medium font size reflecting the current accessibility settings. */
    case AccessibilityMedium
    /** A large font size reflecting the current accessibility settings. */
    case AccessibilityLarge
    /** An extra large font size reflecting the current accessibility settings. */
    case AccessibilityExtraLarge
    /** An increasingly large font size reflecting the current accessibility settings. */
    case AccessibilityExtraExtraLarge
    /** The largest font size reflecting the current accessibility settings. */
    case AccessibilityExtraExtraExtraLarge
    
    static let allSizes = [ ExtraSmall, Small, Medium, Large, ExtraLarge, ExtraExtraLarge, ExtraExtraExtraLarge, AccessibilityMedium, AccessibilityLarge, AccessibilityExtraLarge, AccessibilityExtraExtraLarge, AccessibilityExtraExtraExtraLarge]
    
    /**
     The number of typesetter font sizes available. Always returns 12.
    */
    
    static let count = allSizes.count
    
    /**
     Initialize the corresponding TypesetterFontSize for a UIContentSize.
     Parameter contentSize: The UIContentSize to wrap.
    */
    init(contentSize: UIContentSizeCategory) {
        switch contentSize {
        case UIContentSizeCategory.small:
            self = .Small
        case UIContentSizeCategory.medium:
            self = .Medium
        case UIContentSizeCategory.large:
            self = .Large
        case UIContentSizeCategory.extraSmall:
            self = .ExtraSmall
        case UIContentSizeCategory.extraLarge:
            self = .ExtraLarge
        case UIContentSizeCategory.extraExtraLarge:
            self = .ExtraExtraLarge
        case UIContentSizeCategory.extraExtraExtraLarge:
            self = .ExtraExtraExtraLarge
        case UIContentSizeCategory.accessibilityMedium:
            self = .AccessibilityMedium
        case UIContentSizeCategory.accessibilityLarge:
            self = .AccessibilityLarge
        case UIContentSizeCategory.accessibilityExtraLarge:
            self = .AccessibilityExtraLarge
        case UIContentSizeCategory.accessibilityExtraExtraLarge:
            self = .AccessibilityExtraExtraLarge
        case UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            self = .AccessibilityExtraExtraExtraLarge
        default:
            self = .Medium
        }
    }
}
