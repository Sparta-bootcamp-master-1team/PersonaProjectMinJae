import Foundation

final class ViewModel {
    
    private var dataService: DataService
    private var items: [BookAttribute] = []
    
    init(dataService: DataService) {
        self.dataService = dataService
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
