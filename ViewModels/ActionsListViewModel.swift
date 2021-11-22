import Foundation
import Combine

class ActionsListViewModel: ObservableObject {
    @Published var actions: [Action] = []
    private let repo: MLWRepo

    init(repo: MLWRepo) {
        self.repo = repo
    }

    func refresh() {
        repo.actions(projectId: UUID()) { actions in
            self.actions = actions
        }
    }
}
