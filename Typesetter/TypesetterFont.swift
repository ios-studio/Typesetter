/**
 The typesetter font protocol. Implement this to use `Typesetter`s `sizedFontFor` with compile-time checks.
 
 An example implementation would be:
 
 ```Swift
 enum MyFont: String, TypesetterFont {
    case Regular = "Georgia"
    
    var name: String { return rawValue }
 }
 ```
 
 */
public protocol TypesetterFont {
    /**
     The name of the font as stated in the font file.
    */
    var name: String { get }
}