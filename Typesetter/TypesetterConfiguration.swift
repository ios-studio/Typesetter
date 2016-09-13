import UIKit

/**
 A detailed configuration for an instance of `Typesetter`. Allows to set the default font size as well as the path to the size definitions file.
*/
public struct TypesetterConfiguration {
    /**
     The path to the size definitions. By default, `Typesetter` will try and load `FontSizes.csv` from the bundle given to it at initialisation.
    */
    public let sizeDefinitionsPath: String
    
    /**
     The default font size to use when font sizes can not be loaded. Defaults to 12 points.
     */
    public let defaultFontSize: CGFloat
    
    fileprivate let defaultDefaultFontSize: CGFloat = 12.0

    /**
     Initialize a new `TypesetterConfiguration` with a custom path to a definition file.
     
     - Parameter sizeDefinitionsPath: The path to the file to load the font size definitions from.
    */
    public init(sizeDefinitionsPath: String) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultDefaultFontSize
    }
    
    /**
     Initialize a new `TypesetterConfiguration` with a custom path to a definition file and a custom default font size.
     
     - Parameters:
        - sizeDefinitionsPath: The path to the file to load the font size definitions from.
        - defaultFontSize: The default font size to use when the definitions could not be loaded from file.
     */
    public init(sizeDefinitionsPath: String, defaultFontSize: CGFloat) {
        self.sizeDefinitionsPath = sizeDefinitionsPath
        self.defaultFontSize = defaultFontSize
    }
}
