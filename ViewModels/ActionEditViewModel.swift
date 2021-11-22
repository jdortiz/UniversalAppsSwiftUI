import Foundation
import Combine

class ActionEditViewModel: ObservableObject {
    let repo: MLWRepo
    let projectId: UUID
    @Published var name: String = ""

    var saveDisabled: Bool {
        name.isEmpty
    }

    init(repo: MLWRepo, projectId: UUID) {
        self.repo = repo
        self.projectId = projectId
    }

    func save() {
        repo.create(projectId: projectId, action: Action(id: UUID(), name: name, status: false))
    }
}
