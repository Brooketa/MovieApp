struct MovieGenreViewModel {

    let genreID: Int
    let genre: String

    init(from model: DetailsMovieGenreUseCaseModel) {
        genreID = model.genreID
        genre = model.genre
    }

}
