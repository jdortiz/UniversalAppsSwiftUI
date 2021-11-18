import SwiftUI

struct ActionsListView: View {
    var body: some View {
        List {
            ForEach((1...10), id: \.self) {
                Text("Action \($0)")
                    .padding()
            }
        }
        .navigationTitle("Actions")
    }
}

struct ActionsListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionsListView()
        }
    }
}
