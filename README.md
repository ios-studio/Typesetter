# Typesetter [![Build Status](https://travis-ci.org/ios-studio/Typesetter.svg?branch=master)](https://travis-ci.org/ios-studio/Typesetter) [![codecov.io](https://codecov.io/github/ios-studio/Typesetter/coverage.svg?branch=master)](https://codecov.io/github/ios-studio/Typesetter?branch=master) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
Dynamic type is great, but to adjust the typographic setup to work with the font & content sizes available can be daunting.
This library puts you back in control by reading the sizes from a CSV file which can easily be generated from Google Docs or other common table editors.

## Installation

#### Via [Carthage](https://github.com/Carthage/Carthage):
Add the following your Cartfile:

```Swift
github "ios-studio/Typesetter" ~> 0.1.0
```

#### Via [Cocoapods](https://cocoapods.org/):
Add the following your Podfile:

```ruby
pod "Typesetter", "~> 0.1.0"
```

## Default Setup
Typesetter will look for a file named `FontSizes.csv` in your current target. The contents of the file should look like [this](https://github.com/ios-studio/Typesetter/blob/master/TypesetterTests/FontSizes.csv). It is important to not delete any columns or rows, otherwise Typesetter will default to a standard font size for all the fonts.

For the fonts you'd like to use in your project, define a class which conforms to the protocol `TypesetterFont`. The only requirement of that protocol is that the object responds to the property `name`, so for example it could look like:

```Swift
enum Font: String, TypesetterFont {
    case Regular = "MyFont-Regular"
    case Bold = "MyFont-Bold"

    var name: String { return rawValue }
}

```

Where `"MyFont-Regular"` is the name of the font you'd like to use.

## Configuring
Typesetter can be passed a `TypesetterConfiguration` object where you can specify another path to your font sizes file.

## Using Typesetter

Pass the bundle to initialize. Typesetter will look up the `FontSizes` file in the bundle and cache it for subsequent initializations in the same process:

```Swift
let bundle = NSBundle(forClass: self.dynamicType)
let typesetter = Typesetter(bundle: bundle)
```

Typically, all you will then use is the `sizedFontFor` method, which you can use in two ways:

#### Using the `TypesetterTextStyle` enum

Remember the definition of `Font` from above? This is how to get a font sized according to your definitions and the users font size settings:

```Swift
let sizedFont = typesetter.sizedFontFor(.Body, font: Font.Bold)
```

#### Using a string

This is a convenience method to be able to use Typesetter with `@IBDesignable` / `@IBInspectable`. Since `@IBInspectable` does not yet work with enum types, you can use the version of `sizedFontFor` without a type check like so:

```Swift
let sizedFont = typesetter.sizedFontFor("Body", font: Font.Bold)
```

For an example involving `@IBDesignable`, [go to the wiki](https://github.com/ios-studio/Typesetter/wiki/Setting-up-an-@IBDesignable-Label)

## Contributions

Yes please!
