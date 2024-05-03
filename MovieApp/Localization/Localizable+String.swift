import Foundation

extension String {
    /**
     Resolves localized text from provided bundle and table.
     - Parameters:
     - bundle: Bundle containing the table.
     - tableName: Table containing the localization text.
     - Returns: String localized to current system language.
     */
    func localize(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")
    }

}
