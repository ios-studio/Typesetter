import UIKit
import SwiftCSV

internal class TypesetterTextStyleFontSizeMatrixLoader {
    
    private static var cachedPaths: [String: Typesetter.TextStyleFontSizeMatrix] = [:]
    
    let path: String
    
    init(path: String) {
        self.path = path
    }
    
    func clear() {
        TypesetterTextStyleFontSizeMatrixLoader.cachedPaths.removeValueForKey(path)
    }
    
    func load() -> Typesetter.TextStyleFontSizeMatrix? {
        if let cached = TypesetterTextStyleFontSizeMatrixLoader.cachedPaths[path] { return cached }
        
        guard let csv = loadCSV(path) where !csv.headers.isEmpty else {
            logReadFailure("Could not find or read font sizes csv")
            return nil
        }
        
        let styleNames = csv.headers[1..<csv.headers.count]
        guard let sizeNames = csv.columns["SizeName"] else {
            logReadFailure("Missing \"SizeName\" header in font sizes csv")
            return nil
        }
        
        if let matrix = loadMatrix(csv, styleNames: styleNames, sizeNames: sizeNames) {
            TypesetterTextStyleFontSizeMatrixLoader.cachedPaths[path] = matrix
            return matrix
        }
        
        return nil
    }
    
    private func loadMatrix(csv: CSV, styleNames: ArraySlice<String>, sizeNames: [String]) -> Typesetter.TextStyleFontSizeMatrix? {
        var matrix = Typesetter.TextStyleFontSizeMatrix()
        for styleName in styleNames {
            for (index, sizeName) in sizeNames.enumerate() {
                guard let style = TypesetterTextStyle(rawValue: styleName),
                    size = TypesetterFontSize(rawValue: sizeName),
                    values = csv.columns[styleName],
                    fontSize = Float(values[index])
                    else {
                        logReadFailure("Font sizes csv is corrupt at \(styleName) \(sizeName)")
                        return nil
                }
                
                if matrix[style] == nil { matrix[style] = [:] }
                matrix[style]![size] = CGFloat(fontSize)
            }
        }
        
        if matrix.count < TypesetterTextStyle.count || !matrix.filter({ $0.1.count < TypesetterFontSize.count }).isEmpty {
            logReadFailure("Font sizes csv is missing values")
            return nil
        }
        
        return matrix
    }
    
    private func loadCSV(path: String) -> CSV? {
        let error: NSErrorPointer = nil
        
        do {
            return try CSV(contentsOfFile: path, error: error)
        } catch _ {
            return nil
        }
    }
    
    private func logReadFailure(message: String) {
        NSLog("Typesetter: \(message) - will default to same font size for all fonts")
    }
}