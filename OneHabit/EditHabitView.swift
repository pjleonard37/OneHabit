import SwiftUI
import SwiftData

struct EditHabitView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var habit: Habit
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Habit information")) {
                    Text("Name").font(.headline)
                    TextField("Habit name", text: $habit.name)
                        .padding(.all)
                        .background(Color(.secondarySystemBackground))
                    Text("Details").font(.headline)
                    TextField("Habit details", text: $habit.details)
                        .padding(.all)
                        .background(Color(.secondarySystemBackground))
                }
                Section(header: Text("Streak")) {
                    DatePicker(
                        "Start Date",
                        selection: $habit.firstCompleted,
                        in: ...Date(),
                        displayedComponents: [.date]
                    )
                    DatePicker(
                        "End Date",
                        selection: $habit.lastCompleted,
                        in: ...Date(),
                        displayedComponents: [.date]
                    )
                }
                Button("Save changes") {
                    modelContext.insert(habit)
                    do {
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let testHabit = Habit(name: "my habit", details: "my details")
    return EditHabitView(habit: testHabit)
}
