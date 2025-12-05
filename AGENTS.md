# AGENTS.md - TaskNote Project Instructions (For AI Collaboration)

이 문서는 Gemini 코딩 에이전트(AI)가 이 프로젝트의 코드를 생성 및 검토할 때 준수해야 할 규칙을 명시합니다.

---

## 1. 프로젝트 목표 (Goal)

* **주요 목표:** SwiftUI의 핵심 데이터 관리 4요소 **CRUD (Create-Read-Update-Delete)**를 구현하여 마스터하는 것입니다.
* **참고 앱:** Apple "미리 알림 (Reminders)" 앱의 단순한 UI를 참고하여, 할 일 목록, 완료 토글, 스와이프 삭제 기능을 구현합니다.

## 2. 아키텍처 및 기술 스택 (Architecture & Tech Stack)

* **Platform:** iOS
* **Framework:** SwiftUI
* **Architecture:** **MVVM (Model-View-ViewModel) 패턴을 엄격히 준수할 것.**
    * **Model:** `TaskItem.swift` (데이터 구조 정의)
    * **ViewModel:** `TaskListViewModel.swift` (모든 CRUD 로직 및 데이터 관리)
* **Data Persistence:** `Codable` 프로토콜을 사용하여 `TaskListViewModel`이 `TaskItem` 배열을 `JSON`으로 변환 후 `@AppStorage`에 영구 저장해야 함.

## 3. 코딩 규칙 및 스타일 (Coding Rules)

* **주석:** 모든 코드의 기능 설명과 역할은 **한국어**로 상세하게 작성해야 함. (과제 필수 요구사항)
* **아이콘:** 기본적으로 SF Symbols를 활용할 것.
* **상태 관리:** `@Published`, `@StateObject`, `@ObservedObject`의 용도를 정확히 구분하여 사용할 것.

---
