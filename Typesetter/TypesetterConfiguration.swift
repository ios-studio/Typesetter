import UIKit

public struct TypesetterConfiguration {
    public let sizeDefinitionsPath: String
    public let defaultFontSize: CGFloat
    
    private let defaultSizeDefinitionsPath = NSBundle(forClass: Typesetter.self).pathForResource("FontSizes", ofType: "csv") ?? "NoFontSizesFilePath"
    private let defaultDefaultFontSize: CGFloat = 12.0
    private let defaultApplication = UIApplication.sharedApplication()

    public init() {
        self.sizeDefinitionsPath = defaultSizeDefinitionsPath
        self.defaultFontSize = defaultDefaultFontSize
    }
    
    public init(sizeDefinitionsPath: String) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultDefaultFontSize
    }
    
    public init(sizeDefinitionsPath: String, defaultFontSize: CGFloat) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultFontSize
    }
}