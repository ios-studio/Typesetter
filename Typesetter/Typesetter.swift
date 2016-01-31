import UIKit

public class Typesetter {
    typealias TextStyleFontSizeMatrix = [TypesetterTextStyle: [TypesetterFontSize: CGFloat]]
    
    public static func configure(with configuration: TypesetterConfiguration) {
        self.configuration = configuration
    }
    private static var configuration = TypesetterConfiguration()
    
    public let configuration: TypesetterConfiguration
    
    private let matrix: TextStyleFontSizeMatrix
    private let application = UIApplication.sharedApplication()

    public var hasSizes: Bool {
        return matrix.count > 0
    }
    
    public init(configuration: TypesetterConfiguration = Typesetter.configuration) {
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