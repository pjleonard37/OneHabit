import SwiftUI

struct ContentView: View {
    @State private var habitCount = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("You've completed your habit \(habitCount) times.")
            Button("Record habbit") {
                showAlert.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Habbit name"),
                message: Text("Did you complete your habbit today?"),
                primaryButton: .default(
                    Text("Yes!"),
                    action: {
                        habitCount += 1
                    }
                ),
                secondaryButton: .cancel(
                    Text("No"),
                    action: {
                        print("badddy")
                    }
                )
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
