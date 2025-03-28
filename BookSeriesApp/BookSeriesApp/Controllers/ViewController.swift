import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var viewModel: ViewModel
    private var bookHeaderStackView: BookHeaderStackView
    private var bookInformationStackView: BookInformationStackView
    
    init() {
        self.viewModel = ViewModel()
        self.bookHeaderStackView = BookHeaderStackView()
        self.bookInformationStackView = BookInformationStackView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.bookHeaderStackView = BookHeaderStackView()
        self.bookInformationStackView = BookInformationStackView()
        self.viewModel = ViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        configureLayout()
        bookHeaderStackView.bind(model: viewModel.items)
        bookInformationStackView.bind(model: viewModel.items[0], index: 1)
    }
    private func addViews() {
        view.addSubview(bookHeaderStackView)
        view.addSubview(bookInformationStackView)
    }
    
    private func configureLayout() {
        bookHeaderStackView.snp.makeConstraints { [weak self] make in
            guard let self else { return }
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
        }
        bookInformationStackView.snp.makeConstraints { [weak self] make in
            guard let self else { return }
            make.top.equalTo(bookHeaderStackView.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(5)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(5)
        }
    }
    
}
