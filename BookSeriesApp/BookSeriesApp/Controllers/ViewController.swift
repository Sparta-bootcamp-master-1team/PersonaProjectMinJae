import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var viewModel: ViewModel
    private var bookHeaderStackView: BookHeaderStackView
    private var bookInformationStackView: BookInformationStackView
    private var bookDescriptionStackView: BookDescriptionStackView
    
    init() {
        self.viewModel = ViewModel()
        self.bookHeaderStackView = BookHeaderStackView()
        self.bookInformationStackView = BookInformationStackView()
        self.bookDescriptionStackView = BookDescriptionStackView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.bookHeaderStackView = BookHeaderStackView()
        self.bookInformationStackView = BookInformationStackView()
        self.bookDescriptionStackView = BookDescriptionStackView()
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
        view.addSubview(bookDescriptionStackView)
    }
    
    private func configureLayout() {
        bookHeaderStackView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.trailing.leading.equalToSuperview()
        }
        bookInformationStackView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(bookHeaderStackView.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(5)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(5)
        }
        bookDescriptionStackView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.bookInformationStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}
