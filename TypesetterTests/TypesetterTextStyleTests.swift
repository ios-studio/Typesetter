import XCTest
import Nimble

@testable import Typesetter

class TypesetterTextStyleTests: XCTestCase {

    func testStyleMapping() {
        var mapping: [TypesetterTextStyle: UIFontTextStyle] = [
            .Body: UIFontTextStyle.body,
            .Caption1: UIFontTextStyle.caption1,
            .Caption2: UIFontTextStyle.caption2,
            .Footnote: UIFontTextStyle.footnote,
            .Headline: UIFontTextStyle.headline,
            .Subheadline: UIFontTextStyle.subheadline,
        ]
        
        if #available(iOS 9.0, *) {
            let additionals: [TypesetterTextStyle: UIFontTextStyle] = [
                .Callout: UIFontTextStyle.callout,
                .Title1: UIFontTextStyle.title1,
                .Title2: UIFontTextStyle.title2,
                .Title3: UIFontTextStyle.title3
            ]
            
            for (textStyle, uiTextStyle) in additionals {
                mapping[textStyle] = uiTextStyle
            }
        }
        
        
        for (expectedFontTextStyle, inputFontTextStyle) in mapping {
            expect(TypesetterTextStyle(textStyle: inputFontTextStyle.rawValue)).to(equal(expectedFontTextStyle))
        }
        
        expect(TypesetterTextStyle(textStyle: "Garbage")).to(equal(TypesetterTextStyle.Body))
    }
    
    func testStyleCount() {
        expect(TypesetterTextStyle.count).to(equal(10))
    }

}
