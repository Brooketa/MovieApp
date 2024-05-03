import UIKit

extension UIFont {

    static let heading1: UIFont = .bold(size: 22)
    static let heading2: UIFont = .bold(size: 18)
    static let heading2Bold: UIFont = .bold(size: 18)
    static let heading3: UIFont = .regular(size: 16)
    static let heading3Bold: UIFont = .bold(size: 16)
    static let heading3Heavy: UIFont = .heavy(size: 16)
    static let textVerySmall: UIFont = .regular(size: 9)
    static let textSmall: UIFont = .regular(size: 12)
    static let textRegular: UIFont = .regular(size: 14)
    static let textBold: UIFont = .bold(size: 14)
    static let textBlack: UIFont = .black(size: 14)
    static let textHeavy: UIFont = .black(size: 14)
    static let textLarge: UIFont = .bold(size: 18)
    static let movieTitleRegular: UIFont = .bold(size: 24)
    static let movieTitleBold: UIFont = .bold(size: 24)

    static func regular(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .regular)
    }

    static func semibold(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    static func bold(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .bold)
    }

    static func black(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .black)
    }

    static func heavy(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .heavy)
    }

}
