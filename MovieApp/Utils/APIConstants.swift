struct APIConstants {

    static let popularURL = """
https://api.themoviedb.org\
/3/movie/popular?\
api_key=996a548079728d26102931bab18885f2
"""

    static let topRatedURL = """
https://api.themoviedb.org\
/3/movie/top_rated?\
api_key=996a548079728d26102931bab18885f2
"""

    static let trendingURL = """
https://api.themoviedb.org\
/3/trending/movie/week?\
api_key=996a548079728d26102931bab18885f2
"""

    static let movieURL = """
https://api.themoviedb.org\
/3/movie/%d?\
api_key=996a548079728d26102931bab18885f2
"""

    static let castURL = """
https://api.themoviedb.org\
/3/movie/%d/credits?\
api_key=996a548079728d26102931bab18885f2
"""

    static let reviewURL = """
https://api.themoviedb.org\
/3/movie/%d/reviews?\
api_key=996a548079728d26102931bab18885f2
"""

    static let recommendedURL = """
https://api.themoviedb.org\
/3/movie/%d/recommendations?\
api_key=996a548079728d26102931bab18885f2
"""

    static let searchURL = """
https://api.themoviedb.org\
/3/search/movie?\
api_key=996a548079728d26102931bab18885f2&query=
"""

    static let posterImageRootURL = "https://image.tmdb.org/t/p/w500"

}
