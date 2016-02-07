import UIKit

/** `Typesetter` allows you to load font sizes for different content sizes and text styles from a CSV file which contains a font size matrix. The CSV file has to have the following form:
 
 ```csv
 SizeName,Body,Callout,Caption1,Caption2,Footnote,Headline,Subheadline,Title1,Title2,Title3
 ExtraSmall,7,7,7,7,7,11,7,15,19,23
 Small,9,9,9,9,9,13,9,17,21,25
 Medium,11,11,11,11,11,15,11,19,23,27
 Large,13,13,13,13,13,17,13,21,25,29
 ExtraLarge,15,15,15,15,15,19,15,23,27,31
 ExtraExtraLarge,17,17,17,17,17,21,17,25,29,33
 ExtraExtraExtraLarge,19,19,19,19,19,23,19,27,31,35
 AccessibilityMedium,21,21,21,21,21,25,21,29,33,37
 AccessibilityLarge,23,23,23,23,23,27,23,31,35,39
 AccessibilityExtraLarge,25,25,25,25,25,29,25,33,37,41
 AccessibilityExtraExtraLarge,27,27,27,27,27,31,27,35,39,43
 AccessibilityExtraExtraExtraLarge,29,29,29,29,29,33,29,37,41,45
 ```
 
 Where the columns headers are `TypesetterTextStyle`s and the row headers are `TypesetterFontSize`s.
*/
public class Typesetter {
    internal typealias TextStyleFontSizeMatrix = [TypesetterTextStyle: [TypesetterFontSize: CGFloat]]
    
    private let configuration: TypesetterConfiguration
    private let matrix: TextStyleFontSizeMatrix
    private let application = UIApplication.sharedApplication()

    /**
     Check if this instance of typesetter has sizes loaded. Returns `true` if this instance has successfully loaded font sizes from a file, `false` if not.
    */
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
    
    /**
     Initialize an instance of `Typesetter` by implicitly searching for a file named `FontSizes.csv` in the given bundle. Files loaded are cached for the run time of the application so there is no performance penalty in initializing multiple `Typesetter` instances.
     
     - Parameter bundle: The bundle in which to look for the file named `FontSizes.csv`
    */
    public convenience init(bundle: NSBundle) {
        guard let path = Typesetter.defaultResourcePathForBundle(bundle) else {
            self.init(configuration: TypesetterConfiguration(sizeDefinitionsPath: "NoPath"))
            return
        }
        
        self.init(configuration: TypesetterConfiguration(sizeDefinitionsPath: path))
    }
    
    /**
     Initialize an instance of `Typesetter` with a given custom `TypesetterConfiguration`. Files loaded are cached for the run time of the application so there is no performance penalty in initializing multiple `Typesetter` instances.
    */
    public init(configuration: TypesetterConfiguration) {
        self.configuration = configuration
        if let matrix = TypesetterTextStyleFontSizeMatrixLoader(path: configuration.sizeDefinitionsPath).load() {
            self.matrix = matrix
        } else {
            self.matrix = TextStyleFontSizeMatrix()
        }
    }
    
    /**
     Return an `UIFont` that is sized according to the current content size, given font sizes and text styles.
     
     - Parameters:
        - textStyle: The `TypesetterTextStyle` text style to return the `UIFont` instance for
        - font: The `TypesetterFont` to return the `UIFont` with.
     */
    public func sizedFontFor(textStyle: TypesetterTextStyle, font: TypesetterFont) -> UIFont {
        let size = TypesetterFontSize(contentSize: application.preferredContentSizeCategory)
        let pointSize = sizeFor(size: size, textStyle: textStyle)
        
        return UIFont(descriptor: descriptorFor(textStyle, size: size, font: font), size: pointSize)
    }
    
    /**
     Return an `UIFont` that is sized according to the current content size, given font sizes and text styles. Takes a string for text style to ease use with `@IBInspectable`.
     
     - Parameters:
        - textStyle: The text style as a string to return the `UIFont` instance for
        - font: The `TypesetterFont` to return the `UIFont` with.
    */
    public func sizedFontFor(textStyle: String, font: TypesetterFont) -> UIFont {
        let style = TypesetterTextStyle(rawValue: textStyle) ?? .Body
        
        return sizedFontFor(style, font: font)
    }
    
    private func descriptorFor(textStyle: TypesetterTextStyle, size: TypesetterFontSize, font: TypesetterFont) -> UIFontDescriptor {
        return UIFontDescriptor(name: font.name, size: sizeFor(size: size, textStyle: textStyle))
    }
    
    private func sizeFor(size size: TypesetterFontSize, textStyle: TypesetterTextStyle) -> CGFloat {
        return matrix[textStyle]?[size] ?? configuration.defaultFontSize
    }
    
}