import Foundation

/**
 * TaskItem 모델 정의 (MVVM Model)
 *
 * 이 Struct는 할 일 항목 하나를 나타냅니다.
 *
 * - Identifiable: SwiftUI의 List나 ForEach에서 각 항목을 고유하게 식별하도록 합니다.
 * - Codable: TaskItem 배열을 JSON 형태로 변환하여 영구 저장하기 위해 필수입니다.
 */
struct TaskItem: Identifiable, Codable {
    
    /// Identifiable 요구사항: 각 할 일을 구별하기 위한 고유 ID
    var id = UUID()
    
    /// 할 일의 내용 (제목)
    var title: String
    
    /// 할 일의 완료 상태 (true: 완료, false: 미완료). 기본값은 false입니다.
    var isCompleted: Bool = false
    
    // 참고: isCompleted 변수를 var로 선언하여 나중에 완료 상태를 변경(Update)할 수 있게 했습니다.
}
