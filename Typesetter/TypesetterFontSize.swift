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
    
    /**
     The number of typesetter font sizes available. Always returns 12.
    */
    static var count: Int {
        var count = 0

        switch self.Small {
        case .Small:
            count += 1
            fallthrough
        case .Medium:
            count += 1
            fallthrough
        case .Large:
            count += 1
            fallthrough
        case .ExtraSmall:
            count += 1
            fallthrough
        case .ExtraLarge:
            count += 1
            fallthrough
        case .ExtraExtraLarge:
            count += 1
            fallthrough
        case .ExtraExtraExtraLarge:
            count += 1
            fallthrough
        case .AccessibilityMedium:
            count += 1
            fallthrough
        case .AccessibilityLarge:
            count += 1
            fallthrough
        case .AccessibilityExtraLarge:
            count += 1
            fallthrough
        case .AccessibilityExtraExtraLarge:
            count += 1
            fallthrough
        case .AccessibilityExtraExtraExtraLarge:
            count += 1
        }
        
        return count
    }
    
    /**
     Initialize the corresponding TypesetterFontSize for a UIContentSize.
     Parameter contentSize: The UIContentSize to wrap.
    */
    init(contentSize: String) {
        switch contentSize {
        case UIContentSizeCategory.small.rawValue:
            self = .Small
        case UIContentSizeCategory.medium.rawValue:
            self = .Medium
        case UIContentSizeCategory.large.rawValue:
            self = .Large
        case UIContentSizeCategory.extraSmall.rawValue:
            self = .ExtraSmall
        case UIContentSizeCategory.extraLarge.rawValue:
            self = .ExtraLarge
        case UIContentSizeCategory.extraExtraLarge.rawValue:
            self = .ExtraExtraLarge
        case UIContentSizeCategory.extraExtraExtraLarge.rawValue:
            self = .ExtraExtraExtraLarge
        case UIContentSizeCategory.accessibilityMedium.rawValue:
            self = .AccessibilityMedium
        case UIContentSizeCategory.accessibilityLarge.rawValue:
            self = .AccessibilityLarge
        case UIContentSizeCategory.accessibilityExtraLarge.rawValue:
            self = .AccessibilityExtraLarge
        case UIContentSizeCategory.accessibilityExtraExtraLarge.rawValue:
            self = .AccessibilityExtraExtraLarge
        case UIContentSizeCategory.accessibilityExtraExtraExtraLarge.rawValue:
            self = .AccessibilityExtraExtraExtraLarge
        default:
            self = .Medium
        }
    }
}
