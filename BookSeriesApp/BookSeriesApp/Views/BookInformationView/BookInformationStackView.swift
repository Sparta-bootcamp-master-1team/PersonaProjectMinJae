import UIKit
import SnapKit

final class BookInformationStackView: UIStackView {
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var bookAttributeStackView: BookAttributeStackView
    
    override init(frame: CGRect) {
        bookAttributeStackView = BookAttributeStackView()
        super.init(frame: frame)
        axis = .horizontal
        distribution = .fill
        alignment = .top
        spacing = 10
        layoutMargins = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        isLayoutMarginsRelativeArrangement = true
        addViews()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        bookAttributeStackView = BookAttributeStackView()
        super.init(coder: coder)
    }
    
    private func addViews() {
        addArrangedSubview(bookImageView)
        addArrangedSubview(bookAttributeStackView)
    }
    
    private func configureLayout() {
        bookImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(150)
        }
    }
    
    func bind(model: BookAttribute, index: Int) {
        bookImageView.image = UIImage(named: "harrypotter\(index+1)")
        bookAttributeStackView.bind(model: model)
    }
}
