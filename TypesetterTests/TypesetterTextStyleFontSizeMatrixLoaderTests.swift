import XCTest
import Nimble

@testable import Typesetter

class TypesetterTextStyleFontSizeMatrixLoaderTests: XCTestCase {
    
    var fileManager: FileManager!
    
    override func setUp() {
        fileManager = FileManager.default
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCache() {
        let testPath = copyCSVFixtureToTestPath(csvPath("FontSizes"))
        _ = TypesetterTextStyleFontSizeMatrixLoader(path: testPath).load()
        removeCSVFixtureAtPath(testPath)
        
        let cacheLoader = TypesetterTextStyleFontSizeMatrixLoader(path: testPath)
        
        let cachedResult = cacheLoader.load()
        expect(cachedResult?.keys.count).to(equal(10))
        expect(cachedResult?[.Body]?.keys.count).to(equal(12))
        
        cacheLoader.clear()
        
        let deletedResult = cacheLoader.load()
        expect(deletedResult).to(beNil())
    }
    
    fileprivate func copyCSVFixtureToTestPath(_ path: String) -> String {
        let newPath = path.replacingOccurrences(of: "FontSizes", with: "CorrectFontSizes-CacheTest")
        do {
            try fileManager.copyItem(atPath: path, toPath: newPath)
        } catch _ {
            fail("Could not copy file for cache test")
        }
        
        return newPath
    }
    
    fileprivate func removeCSVFixtureAtPath(_ path: String) {
        do {
            try fileManager.removeItem(atPath: path)
        } catch _ {
            fail("Could not remove file for cache test")
        }
    }
    
    func testWithIncorrectPath() {
        let incorrectPath = "Something/Something"
        let sizeMatrix = TypesetterTextStyleFontSizeMatrixLoader(path: incorrectPath).load()
        expect(sizeMatrix).to(beNil())
    }
    
    func testWithCorrectCSV() {
        let loader = TypesetterTextStyleFontSizeMatrixLoader(path: csvPath("FontSizes"))
        let sizeMatrix = loader.load()
        expect(sizeMatrix?.keys.count).to(equal(10))
        expect(sizeMatrix?[.Body]?.keys.count).to(equal(12))
        expect(sizeMatrix?[.Body]?[.Small]).to(equal(9.0))
        loader.clear()
    }
    
    func testWithIncompleteCSV() {
        let sizeMatrix = TypesetterTextStyleFontSizeMatrixLoader(path: csvPath("IncompleteFontSizes")).load()
        expect(sizeMatrix).to(beNil())
    }
    
    func testWithCSVWithMissingSizeHeader() {
        let sizeMatrix = TypesetterTextStyleFontSizeMatrixLoader(path: csvPath("MissingSizeHeader")).load()
        expect(sizeMatrix).to(beNil())
    }
    
    func testWithCorruptCSV() {
        let sizeMatrix = TypesetterTextStyleFontSizeMatrixLoader(path: csvPath("CorruptFontSizes")).load()
        expect(sizeMatrix).to(beNil())
    }
    
    func testWithCorruptFile() {
        let sizeMatrix = TypesetterTextStyleFontSizeMatrixLoader(path: csvPath("CorruptFile")).load()
        expect(sizeMatrix).to(beNil())
    }
    
    fileprivate func csvPath(_ fileName: String) -> String {
        return Bundle(for: type(of: self)).path(forResource: fileName, ofType: "csv") ?? ""
    }
}
