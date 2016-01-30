import XCTest
import Nimble

@testable import Typesetter

class TypesetterFontSizeTests: XCTestCase {
    
    func testSizeMapping() {
        let mapping: [TypesetterFontSize: String] = [
            .Small: UIContentSizeCategorySmall,
            .Medium: UIContentSizeCategoryMedium,
            .Large: UIContentSizeCategoryLarge,
            .ExtraSmall: UIContentSizeCategoryExtraSmall,
            .ExtraLarge: UIContentSizeCategoryExtraLarge,
            .ExtraExtraLarge: UIContentSizeCategoryExtraExtraLarge,
            .ExtraExtraExtraLarge: UIContentSizeCategoryExtraExtraExtraLarge,
            .AccessibilityMedium: UIContentSizeCategoryAccessibilityMedium,
            .AccessibilityLarge: UIContentSizeCategoryAccessibilityLarge,
            .AccessibilityExtraLarge: UIContentSizeCategoryAccessibilityExtraLarge,
            .AccessibilityExtraExtraLarge: UIContentSizeCategoryAccessibilityExtraExtraLarge,
            .AccessibilityExtraExtraExtraLarge: UIContentSizeCategoryAccessibilityExtraExtraExtraLarge
        ]
        
        for (expectedFontSize, inputContentSize) in mapping {
            expect(TypesetterFontSize(contentSize: inputContentSize)).to(equal(expectedFontSize))
        }
    }
    
    func testSizeCount() {
        expect(TypesetterFontSize.count).to(equal(12))
    }
    
    
}
