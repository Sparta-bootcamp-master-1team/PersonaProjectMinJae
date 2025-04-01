import Foundation

final class ViewModel {
    
    private var dataService: DataService
    var items: [BookAttribute] = []
    var currentSeriesIndex: Int = 0
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
                print("Error: \(error)")
            }
        }
    }
    
}
