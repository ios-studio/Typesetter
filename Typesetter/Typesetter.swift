import UIKit

public class Typesetter {
    typealias TextStyleFontSizeMatrix = [TypesetterTextStyle: [TypesetterFontSize: CGFloat]]
    
    private let configuration: TypesetterConfiguration
    private let matrix: TextStyleFontSizeMatrix
    private let application = UIApplication.sharedApplication()

    public var hasSizes: Bool {
        return matrix.count > 0
    }
    
    private static var resourcePaths: [NSBundle: String] = [:]
    private static func defaultResourcePathForBundle(bundle: NSBundle) -> String? {
        if let path = resourcePaths[bundle] {
            return path
        } else if let path = bundle.pathForResource("FontSizes", ofType: "csv") {
            resourcePaths[bundle] = path
            return path
        }
        
        return nil
    }
    
    public convenience init(bundle: NSBundle) {
        guard let path = Typesetter.defaultResourcePathForBundle(bundle) else {
            self.init(configuration: TypesetterConfiguration(sizeDefinitionsPath: "NoPath"))
            return
        }
        
        self.init(configuration: TypesetterConfiguration(sizeDefinitionsPath: path))
    }
    
    public init(configuration: TypesetterConfiguration) {
        self.configuration = configuration
        if let matrix = TypesetterTextStyleFontSizeMatrixLoader(path: configuration.sizeDefinitionsPath).load() {
            self.matrix = matrix
        } else {
            self.matrix = TextStyleFontSizeMatrix()
        }
    }
    
    public func descriptorFor(size size: TypesetterFontSize, textStyle: TypesetterTextStyle, font: TypesetterFont) -> UIFontDescriptor {
        return UIFontDescriptor(name: font.name, size: sizeFor(size: size, textStyle: textStyle))
    }
    
    public func sizedFontFor(textStyle: String, font: TypesetterFont) -> UIFont {
        let style = TypesetterTextStyle(rawValue: textStyle) ?? .Body
        
        return sizedFontFor(style, font: font)
    }
    
    public func sizedFontFor(textStyle: TypesetterTextStyle, font: TypesetterFont) -> UIFont {
        let size = TypesetterFontSize(contentSize: application.preferredContentSizeCategory)
        let pointSize = sizeFor(size: size, textStyle: textStyle)
        
        return UIFont(descriptor: descriptorFor(size: size, textStyle: textStyle, font: font), size: pointSize)
    }
    
    private func sizeFor(size size: TypesetterFontSize, textStyle: TypesetterTextStyle) -> CGFloat {
        return matrix[textStyle]?[size] ?? configuration.defaultFontSize
    }
    
}