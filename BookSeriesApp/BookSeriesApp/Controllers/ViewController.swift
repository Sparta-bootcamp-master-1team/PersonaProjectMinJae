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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isDataFecthed() {
            bind(index: viewModel.currentSeriesIndex)
        } else {
            print("error")
            let alertController = UIAlertController(title: "오류", message: "데이터를 불러오지 못했습니다.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "확인", style: .cancel, handler: {_ in
                exit(0)
            })
            alertController.addAction(cancelAction)
            self.present(alertController, animated: false)
        }
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
    
    private func isDataFecthed() -> Bool {
        return (viewModel.items.count == 0 && viewModel.error != nil) ? false : true
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
