import UIKit

class BookDescriptionScrollView: UIScrollView {
    
    private let bookDescriptionStackView: BookDescriptionStackView
    private var bookInformationStackView: BookInformationStackView
    private let bookChaptersStackView: BookChaptersStackView
    private let contentView = UIView()
    
    override init(frame: CGRect) {
        self.bookDescriptionStackView = BookDescriptionStackView()
        self.bookInformationStackView = BookInformationStackView()
        self.bookChaptersStackView = BookChaptersStackView()
        super.init(frame: frame)
        showsVerticalScrollIndicator = false
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
        self.addSubview(contentView)
        contentView.addSubview(bookDescriptionStackView)
        contentView.addSubview(bookInformationStackView)
        contentView.addSubview(bookChaptersStackView)
    }
    
    private func configureLayout() {
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1000).priority(.low)
        }
        bookInformationStackView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        bookDescriptionStackView.snp.makeConstraints{ [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.bookInformationStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        bookChaptersStackView.snp.makeConstraints { [weak self] in
            guard let self else { return }
            $0.top.equalTo(self.bookDescriptionStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func bind(model: BookAttribute, index: Int) {
        bookInformationStackView.bind(model: model, index: index)
        bookChaptersStackView.bind(model: model)
    }
}
