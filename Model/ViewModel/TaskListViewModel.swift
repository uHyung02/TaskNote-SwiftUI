import Foundation
import SwiftUI

/**
 * TaskListViewModel (MVVM ViewModel)
 *
 * 앱의 핵심 비즈니스 로직과 데이터 상태를 관리합니다.
 *
 * - ObservableObject: View가 이 객체의 @Published 속성 변화를 감지하여 화면을 갱신합니다.
 */
class TaskListViewModel: ObservableObject {
    
    /// 화면에 표시될 할 일 목록 (Read)
    @Published var tasks: [TaskItem] = []
    
    /// 데이터를 기기에 영구 저장하기 위한 저장소 (@AppStorage)
    /// 배열(Array)은 직접 저장이 안 되므로, Data 타입으로 변환하여 저장합니다.
    @AppStorage("tasksData") private var tasksData: Data = Data()
    
    /// 초기화: 앱이 켜질 때 저장된 데이터를 불러옵니다.
    init() {
        loadTasks()
    }
    
    // MARK: - CRUD Functions (기능 구현)
    
    /// 1. 할 일 생성 (Create)
    func addTask(title: String) {
        let newTask = TaskItem(title: title)
        tasks.append(newTask) // 리스트 끝에 추가
        saveTasks() // 저장
    }
    
    /// 2. 할 일 완료 상태 토글 (Update)
    func toggleCompletion(task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks() // 변경 사항 저장
        }
    }
    
    /// 3. 할 일 삭제 (Delete)
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks() // 변경 사항 저장
    }
    
    // MARK: - Data Persistence (데이터 영구 저장)
    
    /// tasks 배열을 JSON 데이터로 변환하여 AppStorage에 저장
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            tasksData = encoded
        }
    }
    
    /// AppStorage에 저장된 JSON 데이터를 tasks 배열로 복원
    private func loadTasks() {
        if let decoded = try? JSONDecoder().decode([TaskItem].self, from: tasksData) {
            tasks = decoded
        }
    }
}
