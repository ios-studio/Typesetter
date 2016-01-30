import XCTest
import Nimble

@testable import Typesetter

class TypesetterTextStyleFontSizeMatrixLoaderTests: XCTestCase {
    
    var fileManager: NSFileManager!
    
    override func setUp() {
        fileManager = NSFileManager.defaultManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCache() {
        let testPath = copyCSVFixtureToTestPath(csvPath("FontSizes"))
        TypesetterTextStyleFontSizeMatrixLoader(path: testPath).load()
        removeCSVFixtureAtPath(testPath)
        
        let cacheLoader = TypesetterTextStyleFontSizeMatrixLoader(path: testPath)
        
        let cachedResult = cacheLoader.load()
        expect(cachedResult?.keys.count).to(equal(10))
        expect(cachedResult?[.Body]?.keys.count).to(equal(12))
        
        cacheLoader.clear()
        
        let deletedResult = cacheLoader.load()
        expect(deletedResult).to(beNil())
    }
    
    private func copyCSVFixtureToTestPath(path: String) -> String {
        let newPath = path.stringByReplacingOccurrencesOfString("FontSizes", withString: "CorrectFontSizes-CacheTest")
        do {
            try fileManager.copyItemAtPath(path, toPath: newPath)
        } catch _ {
            fail("Could not copy file for cache test")
        }
        
        return newPath
    }
    
    private func removeCSVFixtureAtPath(path: String) {
        do {
            try fileManager.removeItemAtPath(path)
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
    
    func testWithCorruptCSV() {
        let sizeMatrix = TypesetterTextStyleFontSizeMatrixLoader(path: csvPath("CorruptFontSizes")).load()
        expect(sizeMatrix).to(beNil())
    }
    
    private func csvPath(fileName: String) -> String {
        return NSBundle(forClass: self.dynamicType).pathForResource(fileName, ofType: "csv") ?? ""
    }
}
