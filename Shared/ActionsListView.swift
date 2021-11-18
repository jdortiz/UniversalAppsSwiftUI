import SwiftUI

struct ActionsListView: View {
    let projectId: Int?
    var body: some View {
        List {
            ForEach((1...10), id: \.self) { actionId in
                NavigationLink(destination: ActionDetailView(actionId: actionId)) {
                    Text("Action \(actionId)")
                        .padding()
                }
            }
        }
        .navigationTitle("Project \(projectId ?? -1)")
    }
}

struct ActionsListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionsListView(projectId: nil)
        }
    }
}
