import Foundation

extension UserDefaults {

    @objc dynamic var favorites: [Int] {
        get {
            return array(forKey: "favorite_movies") as? [Int] ?? []
        }
        set {
            set(newValue, forKey: "favorite_movies")
        }
    }

}
