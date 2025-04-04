import Foundation

final class ViewModel {
    
    private var dataService: DataService
    var items: [BookAttribute] = []
    // 현재 선택된 시리즈의 인덱스
    var currentSeriesIndex: Int = 0
    var error: Error?
    
    init() {
        self.dataService = DataService()
        fetchData()
    }
    private func fetchData() {
        dataService.loadBooks { [weak self] result in
            switch result {
            case .success(let books):
                self?.items = books
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                self?.error = error
            }
        }
    }
    
}
