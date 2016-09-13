import UIKit

internal class TypesetterTextStyleFontSizeMatrixLoader {
    
    fileprivate static var cachedPaths: [String: Typesetter.TextStyleFontSizeMatrix] = [:]
    
    let path: String
    
    init(path: String) {
        self.path = path
    }
    
    func clear() {
        TypesetterTextStyleFontSizeMatrixLoader.cachedPaths.removeValue(forKey: path)
    }
    
    func load() -> Typesetter.TextStyleFontSizeMatrix? {
        if let cached = TypesetterTextStyleFontSizeMatrixLoader.cachedPaths[path] { return cached }
        
        guard let csv = loadCSV(path) , !csv.headers.isEmpty else {
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
    
    fileprivate func loadMatrix(_ csv: CSV, styleNames: ArraySlice<String>, sizeNames: [String]) -> Typesetter.TextStyleFontSizeMatrix? {
        var matrix = Typesetter.TextStyleFontSizeMatrix()
        for styleName in styleNames {
            for (index, sizeName) in sizeNames.enumerated() {
                guard let style = TypesetterTextStyle(rawValue: styleName),
                    let size = TypesetterFontSize(rawValue: sizeName),
                    let values = csv.columns[styleName],
                    let fontSize = Float(values[index])
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
    
    fileprivate func loadCSV(_ path: String) -> CSV? {
        return CSV(contentsOfFile: path)
    }
    
    fileprivate func logReadFailure(_ message: String) {
        NSLog("Typesetter: \(message) - will default to same font size for all fonts")
    }
}
