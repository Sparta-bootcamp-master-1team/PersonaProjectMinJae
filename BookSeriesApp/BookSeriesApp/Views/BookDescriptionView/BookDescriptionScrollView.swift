import UIKit

class BookDescriptionScrollView: UIScrollView {
    
    private let bookDescriptionStackView: BookDescriptionStackView
    private var bookInformationStackView: BookInformationStackView
    private let bookChaptersStackView: BookChaptersStackView
    
    override init(frame: CGRect) {
        self.bookDescriptionStackView = BookDescriptionStackView()
        self.bookInformationStackView = BookInformationStackView()
        self.bookChaptersStackView = BookChaptersStackView()
        super.init(frame: frame)
        backgroundColor = .cyan
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        self.bookInformationStackView = BookInformationStackView()
        self.bookDescriptionStackView = BookDescriptionStackView()
        self.bookChaptersStackView = BookChaptersStackView()
        super.init(coder: coder)
    }
    
    private func addViews() {
        self.addSubview(bookDescriptionStackView)
        self.addSubview(bookInformationStackView)
        self.addSubview(bookChaptersStackView)
    }
    
    private func configureLayout() {
        bookInformationStackView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        bookDescriptionStackView.snp.makeConstraints{ [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.bookInformationStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        bookChaptersStackView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.bookDescriptionStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func bind(model: BookAttribute, index: Int) {
        bookInformationStackView.bind(model: model, index: index)
        bookChaptersStackView.bind(model: model)
    }
}
