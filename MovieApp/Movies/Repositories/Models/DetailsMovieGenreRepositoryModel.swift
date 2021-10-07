struct DetailsMovieGenreRepositoryModel {

    let genreID: Int
    let genre: String

    init(from model: DetailsMovieGenreDataModel) {
        genreID = model.genreID
        genre = model.genre
    }

}
