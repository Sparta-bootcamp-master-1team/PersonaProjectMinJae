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
        super.init(coder: coder)
    }
    
    func bind(model: BookAttribute, index: Int) {
        bookSummaryStackView.bind(model: model, index: index)
        bookDedicationStackView.bind(model: model)
    }
    
}
