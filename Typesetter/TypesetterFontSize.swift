import UIKit

public enum TypesetterFontSize: String {
    case Small
    case Medium
    case Large
    case ExtraSmall
    case ExtraLarge
    case ExtraExtraLarge
    case ExtraExtraExtraLarge
    case AccessibilityMedium
    case AccessibilityLarge
    case AccessibilityExtraLarge
    case AccessibilityExtraExtraLarge
    case AccessibilityExtraExtraExtraLarge
        
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