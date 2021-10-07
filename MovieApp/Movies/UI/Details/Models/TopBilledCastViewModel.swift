import Foundation

struct TopBilledCastViewModel {

    let castName: String
    let castRole: String
    let castProfileImageURL: URL?

    init(from model: DetailsCastUseCaseModel) {
        castName = model.castName
        castRole = model.castRole
        castProfileImageURL = model.castProfileImageURL
    }

}
