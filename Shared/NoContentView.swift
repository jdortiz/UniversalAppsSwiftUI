import SwiftUI

struct NoContentView: View {
    // MARK: - View
    var body: some View {
        VStack {
            Text("No content to display here yet.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
    }
}

struct NoContentViewPreviews: PreviewProvider {
    static var previews: some View {
        NoContentView()
    }
}
