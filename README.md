# PersonaProjectMinJae

## Introduction

주어진 데이터를 불러와 시리즈별로 나타내는 App입니다.<br>
 [@minjae-L](https://github.com/minjae-L) 

## Tech Stack

* Base: Xcode, Swift, iOS, Git
* UI: UIKit(Programmatic), AutoLayout, SnapKit
* Architecture: MVVM
* Dependency Management: Swift Package Manager

## Project Structure

```
BookSeriesApp
 ┣ Assets.xcassets
 ┃ ┗ LaunchScreen.storyboard
 ┣ Controllers
 ┃ ┗ ViewController.swift
 ┣ Delegates
 ┃ ┣ AppDelegate.swift
 ┃ ┗ SceneDelegate.swift
 ┣ Model
 ┃ ┗ Model.swift
 ┣ ViewModel
 ┃ ┗ ViewModel.swift
 ┣ Views
 ┃ ┣ BookDescriptionView
 ┃ ┃ ┣ BookChaptersStackView.swift
 ┃ ┃ ┣ BookDedicationStackView.swift
 ┃ ┃ ┣ BookDescriptionScrollView.swift
 ┃ ┃ ┣ BookDescriptionStackView.swift
 ┃ ┃ ┗ BookSummaryStackView.swift
 ┃ ┣ BookHeaderView
 ┃ ┃ ┣ BookHeaderButtonStackView.swift
 ┃ ┃ ┗ BookHeaderStackView.swift
 ┃ ┗ BookInformationView
 ┃ ┃ ┣ BookAttributeStackView.swift
 ┃ ┃ ┗ BookInformationStackView.swift
 ┣ DataService.swift
 ┗ data.json
```

## Features
- 시리즈 버튼 클릭 시 해당 시리즈의 내용이 노출됩니다.

![Simulator Screen Recording - iPhone 16 Pro - 2025-04-04 at 11 02 03](https://github.com/user-attachments/assets/1bdc3fb6-7b4f-4716-8dbc-9e0628da0723)


