struct DetailsCastDataModel {

    let castID: Int
    let castName: String
    let castRole: String
    let castCharacter: String
    let castProfileImagePath: String?

    init(from model: DetailsCastResponse) {
        castID = model.castID
        castName = model.castName
        castRole = model.castRole
        castCharacter = model.castCharacter

        guard let profileImagePath = model.castProfileImagePath else {
            castProfileImagePath = nil
            return
        }

        castProfileImagePath = APIConstants.imageBaseURL + profileImagePath
    }

}
