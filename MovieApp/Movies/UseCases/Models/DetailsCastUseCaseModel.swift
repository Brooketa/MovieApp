import Foundation

struct DetailsCastUseCaseModel {

    let castID: Int
    let castName: String
    let castRole: String
    let castCharacter: String
    let castProfileImageURL: URL?

    init(from model: DetailsCastRepositoryModel) {
        castID = model.castID
        castName = model.castName
        castRole = model.castRole
        castCharacter = model.castCharacter

        guard
            let profileImagePath = model.castProfileImagePath
        else {
            castProfileImageURL = nil
            return
        }

        castProfileImageURL = URL(string: profileImagePath)
    }

}
