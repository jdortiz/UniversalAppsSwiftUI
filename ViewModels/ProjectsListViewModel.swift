import Foundation
import Combine

class ProjectsListViewModel: ObservableObject {
    @Published var projects: [Project] = []
    let repo: MLWRepo

    init(repo: MLWRepo) {
        self.repo = repo
    }

    func refresh() {
        repo.fetchProjects { projects in
            self.projects = projects
        }
    }
}
