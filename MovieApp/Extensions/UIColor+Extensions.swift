import UIKit

public extension UIColor {

    static let darkBlue = UIColor(rgb: 0x0B253F)
    static let underlinedButtonGray = UIColor(rgb: 0x828282)
    static let lightGreen = UIColor(rgb: 0x1EC96E)
    static let searchGray = UIColor(rgb: 0xEAEAEB)
    static let accentColor = UIColor.systemPink

    static var navigationBackground: UIColor {
        .resolveColor(forLightMode: .darkBlue, forDarkMode: .systemGray6)
    }

    static var primaryBackground: UIColor {
        .resolveColor(forLightMode: .white, forDarkMode: .systemGray6)
    }

    static var primaryTitle: UIColor {
        .resolveColor(forLightMode: .darkBlue, forDarkMode: .accentColor)
    }

    static var secondaryTitle: UIColor {
        .resolveColor(forLightMode: .black, forDarkMode: .white)
    }

    static var cellTitle: UIColor {
        .resolveColor(forLightMode: .black, forDarkMode: .white)
    }

    static var cellBackgroundColor: UIColor {
        .resolveColor(forLightMode: .white, forDarkMode: .systemGray5)
    }

    static var text: UIColor {
        .resolveColor(forLightMode: .black, forDarkMode: .systemGray)
    }

    static var grayText: UIColor {
        .resolveColor(forLightMode: .gray, forDarkMode: .systemGray)
    }

    static var underlinedButtonTitle: UIColor {
        .resolveColor(forLightMode: .black, forDarkMode: .white)
    }

    static var underline: UIColor {
        .resolveColor(forLightMode: .darkBlue, forDarkMode: .accentColor)
    }

    static var searchTextField: UIColor {
        .resolveColor(forLightMode: .searchGray, forDarkMode: .systemGray4)
    }

    static var textFieldIcon: UIColor {
        .resolveColor(forLightMode: .darkBlue, forDarkMode: .systemGray2)
    }

    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF)
    }

    private static func resolveColor(
        forLightMode lightModeColor: UIColor,
        forDarkMode darkModeColor: UIColor
    ) -> UIColor {
        UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
            switch uiTraitCollection.userInterfaceStyle {
            case .dark:
                return darkModeColor
            case .unspecified, .light:
                return lightModeColor
            @unknown default:
                return lightModeColor
            }
        }
    }

}
