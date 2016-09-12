import XCTest
import Nimble

@testable import Typesetter

class TypesetterFontSizeTests: XCTestCase {
    
    func testSizeMapping() {
        let mapping: [TypesetterFontSize: UIContentSizeCategory] = [
            .Small: .small,
            .Medium: .medium,
            .Large: .large,
            .ExtraSmall: .extraSmall,
            .ExtraLarge: .extraLarge,
            .ExtraExtraLarge: .extraExtraLarge,
            .ExtraExtraExtraLarge: .extraExtraExtraLarge,
            .AccessibilityMedium: .accessibilityMedium,
            .AccessibilityLarge: .accessibilityLarge,
            .AccessibilityExtraLarge: .accessibilityExtraLarge,
            .AccessibilityExtraExtraLarge: .accessibilityExtraExtraLarge,
            .AccessibilityExtraExtraExtraLarge: .accessibilityExtraExtraExtraLarge
        ]
        
        for (expectedFontSize, inputContentSize) in mapping {
            expect(TypesetterFontSize(contentSize: inputContentSize)).to(equal(expectedFontSize))
        }
    }
    
    func testSizeCount() {
        expect(TypesetterFontSize.count).to(equal(12))
    }
    
    
}
