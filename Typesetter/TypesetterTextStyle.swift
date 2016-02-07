import UIKit

/**
 A wrapper around UIFontTextStyles. Maps 1:1 to the corresponding UIFontTextStyle for iOS 9 while allowing for nicer notation.
*/
public enum TypesetterTextStyle: String {
    /** The text style used for body text. */
    case Body
    /** The text style used for callouts. */
    case Callout
    /** The text style used for standard captions. */
    case Caption1
    /** The text style used for alternate captions. */
    case Caption2
    /** The text style used in footnotes. */
    case Footnote
    /** The text style used for headings. */
    case Headline
    /** The text style used for subheadings. */
    case Subheadline
    /** The text style used for first level hierarchical headings. */
    case Title1
    /** The text style used for second level hierarchical headings. */
    case Title2
    /** The text style used for third level hierarchical headings. */
    case Title3
    
    /**
     The count of available text styles, which is 10.
    */
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
    
    /**
     Initializes a new text style from an UITextStyle
     
     - Parameter textStyle: The UITextStyle to map.
    */
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