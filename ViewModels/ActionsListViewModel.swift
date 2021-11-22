import Foundation
import Combine

class ActionsListViewModel: ObservableObject, Hashable {
    static func == (lhs: ActionsListViewModel, rhs: ActionsListViewModel) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }

    @Published var actions: [Action] = []
    private let repo: MLWRepo
    private let projectId: UUID

    init(repo: MLWRepo, projectId: UUID) {
        self.repo = repo
        self.projectId = projectId
        repo.add(observer: self)
    }

    func refresh() {
        repo.fetchActions(projectId: projectId) { actions in
            self.actions = actions
        }
    }
}

extension ActionsListViewModel: MLWRepoObserver {
    func actionsChanged() {
        repo.fetchActions(projectId: projectId) { actions in
            self.actions = actions
        }
    }
}
