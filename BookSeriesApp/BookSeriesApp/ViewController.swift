import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var bookHeaderStackView: UIStackView
    private var viewModel: ViewModel
    init(bookHeaderStackView: UIStackView = BookHeaderStackView(),
         viewModel: ViewModel = ViewModel(dataService: DataService())) {
        self.viewModel = viewModel
        self.bookHeaderStackView = bookHeaderStackView
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        self.bookHeaderStackView = BookHeaderStackView()
        self.viewModel = ViewModel(dataService: DataService())
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        configureLayout()
        
    }
    private func addViews() {
        view.addSubview(bookHeaderStackView)
    }
    
    private func configureLayout() {
        bookHeaderStackView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
        }
    }
    
}

