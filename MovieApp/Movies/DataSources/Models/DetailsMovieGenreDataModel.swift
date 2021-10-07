struct DetailsMovieGenreDataModel {

    let genreID: Int
    let genre: String

    init(from model: DetailsMovieGenreResponse) {
        genreID = model.genreID
        genre = model.genre
    }

}
