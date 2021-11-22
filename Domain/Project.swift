import  Foundation

struct Project: Identifiable {
    let id: UUID
    var name: String
    var actions: [UUID]
}
