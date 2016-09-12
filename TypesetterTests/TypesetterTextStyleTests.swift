import XCTest
import Nimble

@testable import Typesetter

class TypesetterTextStyleTests: XCTestCase {

    func testStyleMapping() {
        var mapping: [TypesetterTextStyle: UIFontTextStyle] = [
            .Body: .body,
            .Caption1: .caption1,
            .Caption2: .caption2,
            .Footnote: .footnote,
            .Headline: .headline,
            .Subheadline: .subheadline,
        ]
        
        if #available(iOS 9.0, *) {
            let additionals: [TypesetterTextStyle: UIFontTextStyle] = [
                .Callout: .callout,
                .Title1: .title1,
                .Title2: .title2,
                .Title3: .title3
            ]
            
            for (textStyle, textStyleString) in additionals {
                mapping[textStyle] = textStyleString
            }
        }
        
        
        for (expectedFontTextStyle, inputFontTextStyleString) in mapping {
            expect(TypesetterTextStyle(textStyle: inputFontTextStyleString)).to(equal(expectedFontTextStyle))
        }
        
        expect(TypesetterTextStyle(textStyle: UIFontTextStyle(rawValue: "Garbage"))).to(equal(TypesetterTextStyle.Body))
    }
    
    func testStyleCount() {
        expect(TypesetterTextStyle.count).to(equal(10))
    }

}
