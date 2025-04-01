import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var viewModel: ViewModel
    private var bookHeaderStackView: BookHeaderStackView
    private let bookDescriptionScrollView: BookDescriptionScrollView
    
    init() {
        self.viewModel = ViewModel()
        self.bookHeaderStackView = BookHeaderStackView()
        self.bookDescriptionScrollView = BookDescriptionScrollView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.bookHeaderStackView = BookHeaderStackView()
        self.bookDescriptionScrollView = BookDescriptionScrollView()
        self.viewModel = ViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bookHeaderStackView.buttonStackView.delegate = self
        addViews()
        configureLayout()
        bind(index: viewModel.currentSeriesIndex)
    }
    private func addViews() {
        view.addSubview(bookHeaderStackView)
        view.addSubview(bookDescriptionScrollView)
    }
    
    private func configureLayout() {
        bookHeaderStackView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.trailing.leading.equalToSuperview()
        }
        bookDescriptionScrollView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.bookHeaderStackView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func bind(index: Int) {
        bookHeaderStackView.bind(model: viewModel.items[viewModel.currentSeriesIndex],
                                 count: viewModel.items.count)
        bookDescriptionScrollView.bind(model: viewModel.items[viewModel.currentSeriesIndex],
                                       index: viewModel.currentSeriesIndex)
    }
    
}

extension ViewController: BookHeaderButtonStackViewDelegate {
    func buttonTapped(at index: Int) {
        viewModel.currentSeriesIndex = index
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.bind(index: viewModel.currentSeriesIndex)
        }
        
    }
}
