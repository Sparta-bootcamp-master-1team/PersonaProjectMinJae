import UIKit
import SnapKit

final class BookInformationStackView: UIStackView {
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "harrypotter1")
        return imageView
    }()
    
    private var bookAttributeStackView: UIStackView
    
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
        bookImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
    }
}
