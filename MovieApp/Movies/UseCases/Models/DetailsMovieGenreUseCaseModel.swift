struct DetailsMovieGenreUseCaseModel {

    let genreID: Int
    let genre: String

    init(from model: DetailsMovieGenreRepositoryModel) {
        genreID = model.genreID
        genre = model.genre
    }

}
