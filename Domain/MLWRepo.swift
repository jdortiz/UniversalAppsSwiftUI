import Foundation

protocol MLWRepo {
    func fetchProjects(completion: ([Project]) -> Void)
    func fetchActions(projectId: UUID, completion: ([Action]) -> Void)
}
