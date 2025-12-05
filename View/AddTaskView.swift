import SwiftUI

/**
 * AddTaskView (View)
 *
 * 새로운 할 일을 입력받는 화면입니다.
 * MainView(TaskListView)에서 '시트(Sheet)' 형태로 띄워집니다.
 */
struct AddTaskView: View {
    
    /// 현재 화면을 닫기(Dismiss) 위한 환경 변수
    @Environment(\.dismiss) var dismiss
    
    /// MainView에서 넘겨받은 ViewModel (데이터 추가를 위해 필요)
    @ObservedObject var viewModel: TaskListViewModel
    
    /// 입력창에 입력된 텍스트를 임시로 저장하는 변수
    @State private var title: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                // 할 일 입력 텍스트 필드
                TextField("할 일을 입력하세요 (예: iOS 강의 듣기)", text: $title)
            }
            .navigationTitle("새로운 할 일")
            .toolbar {
                // 왼쪽 취소 버튼
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        dismiss() // 화면 닫기
                    }
                }
                
                // 오른쪽 저장 버튼
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("저장") {
                        if !title.isEmpty {
                            // 1. ViewModel의 할 일 추가 함수 호출
                            viewModel.addTask(title: title)
                            // 2. 화면 닫기
                            dismiss()
                        }
                    }
                    .disabled(title.isEmpty) // 내용이 없으면 버튼 비활성화
                }
            }
        }
    }
}
