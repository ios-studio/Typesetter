import UIKit

public struct TypesetterConfiguration {
    public let sizeDefinitionsPath: String
    public let defaultFontSize: CGFloat
    
    private let defaultDefaultFontSize: CGFloat = 12.0

    public init(sizeDefinitionsPath: String) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultDefaultFontSize
    }
    
    public init(sizeDefinitionsPath: String, defaultFontSize: CGFloat) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultFontSize
    }
}