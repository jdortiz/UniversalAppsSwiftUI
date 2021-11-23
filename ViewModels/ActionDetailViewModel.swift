import Foundation
import Combine

class ActionDetailViewModel: ObservableObject {
    // MARK: - Properties
    let repo: MLWRepo
    let actionId: UUID
    @Published var action: Action

    init(repo: MLWRepo, actionId: UUID) {
        self.repo = repo
        self.actionId = actionId
        self.action = Action(id: UUID(), name: "", status: false)

        repo.getAction(actionId: actionId) { action in
            self.action = action
        }
    }

    func update() {
        repo.update(action: action)
    }
}
