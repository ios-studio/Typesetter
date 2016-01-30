import XCTest
import Nimble

import Typesetter

class TypesetterConfigurationTests: XCTestCase {
    
    func testDefaults() {
        let configuration = TypesetterConfiguration()
        expect(configuration.sizeDefinitionsPath).to(equal("NoFontSizesFilePath"))
        expect(configuration.defaultFontSize).to(equal(12.0))
    }

    func testSizeDefinitionsPath() {
        let configuration = TypesetterConfiguration(sizeDefinitionsPath: "PATH")
        expect(configuration.sizeDefinitionsPath).to(equal("PATH"))
    }
    
    func testDefaultFontSize() {
        let configuration = TypesetterConfiguration(sizeDefinitionsPath: "PATH", defaultFontSize: 14.0)
        expect(configuration.defaultFontSize).to(equal(14.0))
    }

}
