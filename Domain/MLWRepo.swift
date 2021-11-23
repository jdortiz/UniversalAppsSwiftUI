import Foundation

protocol MLWRepo {
    func fetchProjects(completion: ([Project]) -> Void)
    func fetchActions(projectId: UUID, completion: ([Action]) -> Void)
    func getAction(actionId: UUID, completion: (Action) -> Void)
    func update(action: Action)
    func create(projectId: UUID, action: Action)
    func add<O>(observer: O) where O: MLWRepoObserver, O: Hashable
}

protocol MLWRepoObserver {
    func actionsChanged()
}
