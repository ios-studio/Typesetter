import XCTest
import Nimble

@testable import Typesetter

class TypesetterTextStyleTests: XCTestCase {

    func testStyleMapping() {
        var mapping: [TypesetterTextStyle: String] = [
            .Body: UIFontTextStyleBody,
            .Caption1: UIFontTextStyleCaption1,
            .Caption2: UIFontTextStyleCaption2,
            .Footnote: UIFontTextStyleFootnote,
            .Headline: UIFontTextStyleHeadline,
            .Subheadline: UIFontTextStyleSubheadline,
        ]
        
        if #available(iOS 9.0, *) {
            let additionals: [TypesetterTextStyle: String] = [
                .Callout: UIFontTextStyleCallout,
                .Title1: UIFontTextStyleTitle1,
                .Title2: UIFontTextStyleTitle2,
                .Title3: UIFontTextStyleTitle3
            ]
            
            for (textStyle, textStyleString) in additionals {
                mapping[textStyle] = textStyleString
            }
        }
        
        
        for (expectedFontTextStyle, inputFontTextStyleString) in mapping {
            expect(TypesetterTextStyle(textStyle: inputFontTextStyleString)).to(equal(expectedFontTextStyle))
        }
    }
    
    func testStyleCount() {
        expect(TypesetterTextStyle.count).to(equal(10))
    }

}
