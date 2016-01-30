import UIKit

public struct TypesetterConfiguration {
    let sizeDefinitionsPath: String
    let defaultFontSize: CGFloat
    
    private let defaultSizeDefinitionsPath = NSBundle(forClass: Typesetter.self).pathForResource("FontSizes", ofType: "csv") ?? "NoFontSizesFilePath"
    private let defaultDefaultFontSize: CGFloat = 12.0
    private let defaultApplication = UIApplication.sharedApplication()

    init() {
        self.sizeDefinitionsPath = defaultSizeDefinitionsPath
        self.defaultFontSize = defaultDefaultFontSize
    }
    
    init(sizeDefinitionsPath: String) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultDefaultFontSize
    }
    
    init(sizeDefinitionsPath: String, defaultFontSize: CGFloat) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultFontSize
    }
}