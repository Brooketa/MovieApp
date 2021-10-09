import Foundation

struct TopBilledCastViewModel: Hashable {

    let uuid: UUID
    let castName: String
    let castRole: String
    let castProfileImageURL: URL?

    init(from model: DetailsCastUseCaseModel) {
        uuid = UUID()
        castName = model.castName
        castRole = model.castRole
        castProfileImageURL = model.castProfileImageURL
    }

}
