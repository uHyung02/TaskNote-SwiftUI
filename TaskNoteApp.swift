import SwiftUI

/**
 * TaskNoteApp (App Entry Point)
 *
 * 앱의 진입점입니다. @main 속성이 붙어 있어 앱이 실행될 때 가장 먼저 호출됩니다.
 */
@main
struct TaskNoteApp: App {
    var body: some Scene {
        WindowGroup {
            // 앱이 실행되면 가장 먼저 메인 화면(TaskListView)을 보여줍니다.
            TaskListView()
        }
    }
}
