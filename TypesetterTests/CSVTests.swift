//
//  CSVTests.swift
//  Typesetter
//
//  Created by Beat Richartz on 06/02/2016.
//  Copyright © 2016 Beat Richartz. All rights reserved.
//

import XCTest
import Nimble

@testable import Typesetter

class CSVTests: XCTestCase {

    func testParseHeaders() {
        let parsed = CSV(contentsOfFile: csvPath("CSV"))
        expect(parsed?.headers).to(equal(["a", "b", "cd"]))
    }
    
    func testParseColumns() {
        let parsed = CSV(contentsOfFile: csvPath("CSV"))
        expect(parsed?.columns["a"]).to(equal(["1", "5"]))
        expect(parsed?.columns["b"]).to(equal(["2", "6"]))
        expect(parsed?.columns["cd"]).to(equal(["34", "78"]))
    }
    
    func testParseCorrupt() {
        let parsed = CSV(contentsOfFile: csvPath("CorruptFile"))
        expect(parsed).to(beNil())
    }
    
    private func csvPath(fileName: String) -> String {
        return NSBundle(forClass: self.dynamicType).pathForResource(fileName, ofType: "csv") ?? ""
    }

}
