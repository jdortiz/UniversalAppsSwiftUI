import Foundation

class InMemoryRepo: MLWRepo {
    private var actions: [Action]
    private var projects: [Project]
    static let shared = InMemoryRepo()

    private init() {
        let actionWS0 = UUID()
        let actionWS1 = UUID()
        let actionWS2 = UUID()
        let actionLV0 = UUID()
        let actionLV1 = UUID()
        actions = [
            Action(id: actionWS0, name: "Prepare workshop", status: false),
            Action(id: actionLV0, name: "Antigen test", status: false),
            Action(id: actionWS1, name: "Write code", status: false),
            Action(id: actionWS2, name: "Create slides", status: false),
            Action(id: actionLV1, name: "Get dollars", status: false)
        ]
        projects = [
            Project(id: UUID(), name: "Universal Apps with SwiftUI", actions: [ actionWS0, actionWS1, actionWS2 ]),
            Project(id: UUID(), name: "Trip to las Vegas", actions: [ actionLV0, actionLV1 ]),
            Project(id: UUID(), name: "Trip to Finland", actions: [])
        ]

    }

    func fetchProjects(completion: ([Project]) -> Void) {
        completion(projects)
    }

    func fetchActions(projectId: UUID, completion: ([Action]) -> Void) {
        if let project = projects.first(where: { $0.id == projectId }) {
            let projectActions = actions.filter { action in
                project.actions.contains(action.id)
            }
            completion(projectActions)
        }
    }

    func getAction(actionId: UUID, completion: (Action) -> Void) {
        if let action = actions.first(where: { $0.id == actionId }) {
            completion(action)
        }
    }
}
