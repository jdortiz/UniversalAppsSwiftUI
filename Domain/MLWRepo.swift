import Foundation

protocol MLWRepo {
    func actions(projectId: UUID, completion: ([Action]) -> Void)
}
