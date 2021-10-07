struct DetailsCastRepositoryModel {

    let castID: Int
    let castName: String
    let castRole: String
    let castCharacter: String
    let castProfileImagePath: String?

    init(from model: DetailsCastDataModel) {
        castID = model.castID
        castName = model.castName
        castRole = model.castRole
        castCharacter = model.castCharacter
        castProfileImagePath = model.castProfileImagePath
    }

}
