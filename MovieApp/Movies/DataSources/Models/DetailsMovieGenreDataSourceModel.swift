struct DetailsMovieGenreDataSourceModel {

    let genreID: Int
    let genre: String

    init(from model: DetailsMovieGenreClientModel) {
        genreID = model.genreID
        genre = model.genre
    }

}
