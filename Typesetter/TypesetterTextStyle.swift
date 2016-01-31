import UIKit

public enum TypesetterTextStyle: String {
    case Body
    case Caption1
    case Caption2
    case Footnote
    case Headline
    case Subheadline
    case Callout
    case Title1
    case Title2
    case Title3
    
    // The only count solution that
    // 1. Works for string enums and int enums with non-sequential values or not starting at 0
    // 2. Does not rely on any swift internals
    // 3. Gives a compile time error when an update is needed (non-exhaustive switch case)
    // 4. Can be optimized by the compiler, worst case is n comparison + increment operations
    
    // Weaknesses:
    // 1. Has to start with the right case
    // 2. Allows for double count because of fallthrough
    //
    static var count: Int {
        var count = 0
        switch self.Body {
        case .Body:
            count++
            fallthrough
        case .Callout:
            count++
            fallthrough
        case .Caption1:
            count++
            fallthrough
        case .Caption2:
            count++
            fallthrough
        case .Footnote:
            count++
            fallthrough
        case .Headline:
            count++
            fallthrough
        case .Subheadline:
            count++
            fallthrough
        case .Title1:
            count++
            fallthrough
        case .Title2:
            count++
            fallthrough
        case .Title3:
            count++
        }
        
        return count
    }
    
    init(textStyle: String) {
        if #available(iOS 9.0, *) {
            switch textStyle {
            case UIFontTextStyleBody:
                self = .Body
            case UIFontTextStyleCaption1:
                self = .Caption1
            case UIFontTextStyleCaption2:
                self = .Caption2
            case UIFontTextStyleFootnote:
                self = .Footnote
            case UIFontTextStyleHeadline:
                self = .Headline
            case UIFontTextStyleSubheadline:
                self = .Subheadline
            case UIFontTextStyleCallout:
                self = .Callout
            case UIFontTextStyleTitle1:
                self = .Title1
            case UIFontTextStyleTitle2:
                self = .Title2
            case UIFontTextStyleTitle3:
                self = .Title3
            default:
                self = .Body
            }
        } else {
            switch textStyle {
            case UIFontTextStyleBody:
                self = .Body
            case UIFontTextStyleCaption1:
                self = .Caption1
            case UIFontTextStyleCaption2:
                self = .Caption2
            case UIFontTextStyleFootnote:
                self = .Footnote
            case UIFontTextStyleHeadline:
                self = .Headline
            case UIFontTextStyleSubheadline:
                self = .Subheadline
            default:
                self = .Body
            }
        }
    }
}