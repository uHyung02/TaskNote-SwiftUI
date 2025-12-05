# TaskNote (태스크노트) - SwiftUI 투두 리스트

본 프로젝트는 AI와의 협업(AGENTS.md 표준)을 통해 SwiftUI의 핵심 데이터 관리 기능인 CRUD(생성, 읽기, 수정, 삭제)를 마스터하고 프로젝트를 완성하는 과정을 보여줍니다.

---

## 🚀 주요 기능 (구현할 기능 정의)

| 기능 분류 | 기능 설명 | 해당 CRUD |
| :--- | :--- | :--- |
| **할 일 생성** | `+` 버튼을 눌러 새로운 할 일(Task)을 리스트에 추가합니다. | Create |
| **할 일 목록** | 저장된 모든 할 일 목록을 화면에 표시합니다. | Read |
| **할 일 완료** | 항목을 탭하여 '완료' 또는 '미완료' 상태로 변경합니다. | Update |
| **할 일 삭제** | 목록에서 스와이프하여 특정 할 일을 영구히 제거합니다. | Delete |
| **데이터 영구 저장** | 앱을 껐다 켜도 목록이 사라지지 않도록 기기에 저장합니다. | Persistence |

---

## 🛠 기술 스택 및 구조

* **UI Framework:** SwiftUI
* **Architecture:** MVVM (Model-View-ViewModel) 패턴
* **Data Persistence:** `Codable` & `JSONEncoder/Decoder`를 활용하여 `TaskItem` 배열을 `@AppStorage`에 저장.

### 📂 프로젝트 구조
