import Foundation

class InMemoryRepo: MLWRepo {
    private var actions = [
        Action(id: UUID(), name: "Prepare workshop", status: false),
        Action(id: UUID(), name: "Write code", status: false),
        Action(id: UUID(), name: "Create slides", status: false)
    ]

    func actions(projectId: UUID, completion: ([Action]) -> Void) {
        completion(actions)
    }
}
