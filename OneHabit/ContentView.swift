import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var habits: [Habit]
    private var habit: Habit {
        return habits.first ?? Habit(name: "nothing", details: "New details")
    }
    @Environment(\.modelContext) private var modelContext
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                Text("You're tracking \(habit.name)")
                Text("You've completed \(habit.name) \(habit.count!) times.")
                    .navigationTitle("One habit")
                    .toolbar {
                        Button {
                            isPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                if habit.needsCompletion() {
                    Button("Mark \(habit.name) as complete?") {
                        habit.lastCompleted = Date.now
                    }
                } else {
                    Text("You're done for the day!")
                }
            }
            Color.main
        }
        .sheet(isPresented: $isPresented, content: {
            EditHabitView(habit: habit)
        })
        .padding()
        .background {
            Color.main
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
