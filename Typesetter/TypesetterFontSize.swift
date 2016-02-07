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
            count++
            fallthrough
        case .Medium:
            count++
            fallthrough
        case .Large:
            count++
            fallthrough
        case .ExtraSmall:
            count++
            fallthrough
        case .ExtraLarge:
            count++
            fallthrough
        case .ExtraExtraLarge:
            count++
            fallthrough
        case .ExtraExtraExtraLarge:
            count++
            fallthrough
        case .AccessibilityMedium:
            count++
            fallthrough
        case .AccessibilityLarge:
            count++
            fallthrough
        case .AccessibilityExtraLarge:
            count++
            fallthrough
        case .AccessibilityExtraExtraLarge:
            count++
            fallthrough
        case .AccessibilityExtraExtraExtraLarge:
            count++
        }
        
        return count
    }
    
    /**
     Initialize the corresponding TypesetterFontSize for a UIContentSize.
     Parameter contentSize: The UIContentSize to wrap.
    */
    init(contentSize: String) {
        switch contentSize {
        case UIContentSizeCategorySmall:
            self = .Small
        case UIContentSizeCategoryMedium:
            self = .Medium
        case UIContentSizeCategoryLarge:
            self = .Large
        case UIContentSizeCategoryExtraSmall:
            self = .ExtraSmall
        case UIContentSizeCategoryExtraLarge:
            self = .ExtraLarge
        case UIContentSizeCategoryExtraExtraLarge:
            self = .ExtraExtraLarge
        case UIContentSizeCategoryExtraExtraExtraLarge:
            self = .ExtraExtraExtraLarge
        case UIContentSizeCategoryAccessibilityMedium:
            self = .AccessibilityMedium
        case UIContentSizeCategoryAccessibilityLarge:
            self = .AccessibilityLarge
        case UIContentSizeCategoryAccessibilityExtraLarge:
            self = .AccessibilityExtraLarge
        case UIContentSizeCategoryAccessibilityExtraExtraLarge:
            self = .AccessibilityExtraExtraLarge
        case UIContentSizeCategoryAccessibilityExtraExtraExtraLarge:
            self = .AccessibilityExtraExtraExtraLarge
        default:
            self = .Medium
        }
    }
}