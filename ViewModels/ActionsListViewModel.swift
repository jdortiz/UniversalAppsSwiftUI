import Foundation
import Combine

class ActionsListViewModel: ObservableObject {
    @Published var actions: [Action] = []
    private let repo: MLWRepo
    private let projectId: UUID

    init(repo: MLWRepo, projectId: UUID) {
        self.repo = repo
        self.projectId = projectId
    }

    func refresh() {
        repo.fetchActions(projectId: projectId) { actions in
            self.actions = actions
        }
    }
}
