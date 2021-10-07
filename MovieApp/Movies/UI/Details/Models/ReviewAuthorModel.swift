import Foundation

struct ReviewAuthorModel {

    let authorName: String?
    let authorUsername: String
    let authorAvatarURL: URL?

    init(from model: DetailsReviewAuthorUseCaseModel) {
        authorName = model.authorName
        authorUsername = model.authorUsername
        authorAvatarURL = model.authorAvatarURL
    }

}
