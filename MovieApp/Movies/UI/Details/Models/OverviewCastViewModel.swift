struct OverviewCastViewModel {

    let castName: String
    let castRole: String

    init(from model: DetailsCastUseCaseModel) {
        castName = model.castName
        castRole = model.castRole
    }

}
