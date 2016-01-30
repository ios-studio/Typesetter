import XCTest
import Nimble

@testable import Typesetter

class TypesetterTextStyleTests: XCTestCase {

    func testStyleMapping() {
        let mapping: [TypesetterTextStyle: String] = [
            .Body: UIFontTextStyleBody,
            .Callout: UIFontTextStyleCallout,
            .Caption1: UIFontTextStyleCaption1,
            .Caption2: UIFontTextStyleCaption2,
            .Footnote: UIFontTextStyleFootnote,
            .Headline: UIFontTextStyleHeadline,
            .Subheadline: UIFontTextStyleSubheadline,
            .Title1: UIFontTextStyleTitle1,
            .Title2: UIFontTextStyleTitle2,
            .Title3: UIFontTextStyleTitle3
        ]
        
        for (expectedFontTextStyle, inputFontTextStyleString) in mapping {
            expect(TypesetterTextStyle(textStyle: inputFontTextStyleString)).to(equal(expectedFontTextStyle))
        }
    }
    
    func testStyleCount() {
        expect(TypesetterTextStyle.count).to(equal(10))
    }

}
