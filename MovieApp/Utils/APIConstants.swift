struct APIConstants {

    static let baseURL = "https://api.themoviedb.org/3"

    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    static let apiKey = "api_key=996a548079728d26102931bab18885f2"

    static let popularEndpoint = "/movie/popular?"

    static let topRatedEndpoint = "/movie/top_rated?"

    static let trendingEndpoint = "/trending/movie/week?"

    static let movieEndpoint = "/movie/%@?"

    static let castEndpoint = "/movie/%@/credits?"

    static let reviewEndpoint = "/movie/%@/reviews?"

    static let recommendedEndpoint = "/movie/%@/recommendations?"

    static let searchEndpoint = "/search/movie?api_key=996a548079728d26102931bab18885f2&query=%@"

}
