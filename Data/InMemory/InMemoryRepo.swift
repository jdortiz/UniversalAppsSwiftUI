import Foundation

class InMemoryRepo: MLWRepo {
    private var actions: [Action]
    private var projects: [Project]
    static let shared = InMemoryRepo()
    private var observersAdded: Set<AnyHashable> = []

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

    func update(action: Action) {
        actions = actions.map {
            if $0.id == action.id {
                return action
            } else {
                return $0
            }
        }
        notify()
    }

    func create(projectId: UUID, action: Action) {
        if let projectIndex = projects.firstIndex(where: { $0.id == projectId }) {
            projects[projectIndex].actions.append(action.id)
            actions.append(action)
            notify()
        }
    }

    private var observers: [MLWRepoObserver] {
        observersAdded.compactMap { $0 as? MLWRepoObserver }
    }

    func add<O>(observer: O) where O: MLWRepoObserver, O: Hashable {
        _ = observersAdded.insert(observer)
    }

    private func notify() {
        observers.forEach { $0.actionsChanged() }
    }
}
