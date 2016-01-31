import XCTest
import Nimble

import Typesetter

class TypesetterConfigurationTests: XCTestCase {

    func testSizeDefinitionsPath() {
        let configuration = TypesetterConfiguration(sizeDefinitionsPath: "PATH")
        expect(configuration.sizeDefinitionsPath).to(equal("PATH"))
    }
    
    func testDefaultFontSize() {
        let configuration = TypesetterConfiguration(sizeDefinitionsPath: "PATH", defaultFontSize: 14.0)
        expect(configuration.defaultFontSize).to(equal(14.0))
    }

}
