import Foundation

enum LocalizableString: String, Localizable {

    case cancel = "cancel"

    case homeTitle = "home.title"
    case homeWhatsPopular = "home.whatsPopular"
    case homeTopRated = "home.topRated"
    case homeTrending = "home.trending"
    case homeActionSubcategory = "home.actionSubcategory"
    case homeAdventureSubcategory = "home.adventureSubcategory"
    case homeComedySubcategory = "home.comedySubcategory"
    case homeDocumentarySubcategory = "home.documentarySubcategory"
    case homeDramaSubcategory = "home.dramaSubcategory"
    case homeHorrorSubcategory = "home.horrorSubcategory"
    case homeScienceFictionSubcategory = "home.scienceFictionSubcategory"
    case homeThrillerSubcategory = "home.thrillerSubcategory"
    case homeTodaySubcategory = "home.todaySubcategory"
    case homeWeekSubcategory = "home.weekSubcategory"

    case detailsUserScore = "details.userScore"
    case detailsOverviewTitle = "details.overviewTitle"
    case detailsTopBilledCastTitle = "details.topBilledCastTitle"
    case detailsSocialTitle = "details.socialTitle"
    case detailsRecommendationsTitle = "details.recommendationsTitle"
    case detailsFullCastAndCrewButtonTitle = "details.fullCastAndCrewButtonTitle"
    case detailsShowMore = "details.showMore"
    case detailsShowLess = "details.showLess"
    case detailsWrittenBy = "details.writtenBy"

    case searchPlaceholder = "search.placeholder"

    case favoritesTitle = "favorites.title"

    var bundle: Bundle {
        Bundle.main
    }

    var tableName: String {
        "MovieAppLocalizable"
    }

}
