import SwiftUI

/**
 * TaskListView (View - Main Screen)
 *
 * 앱의 메인 화면입니다.
 * - 할 일 목록 표시 (Read)
 * - 완료 상태 토글 (Update)
 * - 할 일 삭제 (Delete)
 * - 할 일 추가 화면 띄우기 (Create 진입)
 */
struct TaskListView: View {
    
    /// ViewModel 생성 (앱의 데이터와 로직을 담당)
    /// @StateObject: 이 뷰가 생성될 때 ViewModel도 함께 생성되고 유지됩니다.
    @StateObject var viewModel = TaskListViewModel()
    
    /// '할 일 추가' 화면을 띄울지 여부를 결정하는 상태 변수
    @State private var showingAddTaskView = false
    
    var body: some View {
        NavigationView {
            List {
                // ViewModel의 tasks 배열을 반복하여 목록 생성
                ForEach(viewModel.tasks) { task in
                    HStack {
                        // 1. 완료 토글 버튼 (Update)
                        Button(action: {
                            withAnimation {
                                viewModel.toggleCompletion(task: task)
                            }
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                                .font(.title2)
                        }
                        .buttonStyle(PlainButtonStyle()) // 리스트 클릭 간섭 방지
                        
                        // 2. 할 일 내용 (완료 시 취소선 표시)
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? .gray : .primary)
                        
                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
                // 3. 스와이프 삭제 기능 (Delete)
                .onDelete(perform: viewModel.deleteTask)
            }
            .listStyle(InsetGroupedListStyle()) // 깔끔한 리스트 스타일
            .navigationTitle("TaskNote ✅")
            .toolbar {
                // 4. 할 일 추가 버튼 (Create)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddTaskView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // 시트(Sheet) 형태로 할 일 추가 화면 띄우기
            .sheet(isPresented: $showingAddTaskView) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
}
