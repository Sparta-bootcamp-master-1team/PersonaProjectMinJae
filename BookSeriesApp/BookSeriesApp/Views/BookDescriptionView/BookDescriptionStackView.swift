import UIKit

class BookDescriptionStackView: UIStackView {
    
    private let bookDedicationStackView = BookDedicationStackView()
    private let bookSummaryStackView = BookSummaryStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        distribution = .fill
        [bookDedicationStackView, bookSummaryStackView].forEach {
            addArrangedSubview($0)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(model: BookAttribute) {
        bookSummaryStackView.bind(model: model)
        bookDedicationStackView.bind(model: model)
    }
    
}
