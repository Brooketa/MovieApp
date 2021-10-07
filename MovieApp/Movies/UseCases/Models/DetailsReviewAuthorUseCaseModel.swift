import Foundation

struct DetailsReviewAuthorUseCaseModel {

    let authorName: String?
    let authorUsername: String
    let authorAvatarURL: URL?

    init(from model: DetailsReviewAuthorRepositoryModel) {
        authorName = model.authorName
        authorUsername = model.authorUsername

        guard
            let avatarPath = model.authorAvatarPath
        else {
            authorAvatarURL = nil
            return
        }

        authorAvatarURL = URL(string: avatarPath)
    }

}
