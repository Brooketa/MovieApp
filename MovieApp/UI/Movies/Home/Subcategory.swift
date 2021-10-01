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
            return "Action"
        case .adventure:
            return "Adventure"
        case .comedy:
            return "Comedy"
        case .drama:
            return "Drama"
        case .documentary:
            return "Documentary"
        case .horror:
            return "Horror"
        case .scienceFiction:
            return "Science Fiction"
        case .thriller:
            return "Thriller"
        case .today:
            return "Today"
        case .week:
            return "Week"
        }
    }

}
