enum Subcategory: Int {

    case action = 28
    case adventure = 12
    case comedy = 35
    case drama = 18
    case documentary = 99
    case horror = 27
    case scienceFiction = 878
    case thriller = 53
    case today
    case week

    var description: String {
        switch self {
        case .action:
            return LocalizableString.homeActionSubcategory.localized
        case .adventure:
            return LocalizableString.homeAdventureSubcategory.localized
        case .comedy:
            return LocalizableString.homeComedySubcategory.localized
        case .drama:
            return LocalizableString.homeDramaSubcategory.localized
        case .documentary:
            return LocalizableString.homeDocumentarySubcategory.localized
        case .horror:
            return LocalizableString.homeHorrorSubcategory.localized
        case .scienceFiction:
            return LocalizableString.homeScienceFictionSubcategory.localized
        case .thriller:
            return LocalizableString.homeThrillerSubcategory.localized
        case .today:
            return LocalizableString.homeTodaySubcategory.localized
        case .week:
            return LocalizableString.homeWeekSubcategory.localized
        }
    }

}
