//
//  TypesetterTests.swift
//  TypesetterTests
//
//  Created by Beat Richartz on 30/01/2016.
//  Copyright © 2016 Beat Richartz. All rights reserved.
//

import XCTest
import Nimble

import Typesetter

class TypesetterTests: XCTestCase {
    
    enum Font: String, TypesetterFont {
        case Regular
        case Bold
        
        var name: String {
            switch self {
            case .Regular:
                return "Georgia"
            case .Bold:
                return "Courier"
            }
        }
    }
    
    var typesetter: Typesetter!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        guard let csvPath = NSBundle(forClass: self.dynamicType).pathForResource("FontSizes", ofType: "csv") else {
            fail("Font fixture file TypesetterFontSizes.csv is missing")
            return
        }
        
        typesetter = Typesetter(
            configuration: TypesetterConfiguration(sizeDefinitionsPath: csvPath)
        )
    }
    
    override func tearDown() {
        typesetter = nil
        super.tearDown()
    }
    
    func testConvenienceInit() {
        let convenienceTypesetter = Typesetter()
        expect(convenienceTypesetter.hasSizes).to(beFalse())
    }
    
    func testDescriptorFor() {
        let descriptor = typesetter.descriptorFor(size: .Small, textStyle: .Body, font: Font.Bold)
        expect(descriptor.pointSize).to(equal(9.0))
        expect(descriptor.postscriptName).to(equal(Font.Bold.name))
    }
    
    func testFontFor() {
        let font = typesetter.sizedFontFor(TypesetterTextStyle.Subheadline.rawValue, font: Font.Regular)
        expect(font.pointSize).to(equal(11.0))
        expect(font.fontName).to(equal(Font.Regular.name))
        expect(font.familyName).to(equal("Georgia"))
    }
    
    func testFontForWithDifferentCut() {
        let font = typesetter.sizedFontFor(TypesetterTextStyle.Headline.rawValue, font: Font.Bold)
        expect(font.pointSize).to(equal(15.0))
        expect(font.fontName).to(equal(Font.Bold.name))
        expect(font.familyName).to(equal("Courier"))
    }
    
    func testFontForWithInvalidValue() {
        let font = typesetter.sizedFontFor("Garbage", font: Font.Regular)
        expect(font.pointSize).to(equal(11.0))
        expect(font.fontName).to(equal(Font.Regular.name))
        expect(font.familyName).to(equal("Georgia"))
    }
    
}
