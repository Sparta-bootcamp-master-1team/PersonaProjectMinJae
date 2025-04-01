import UIKit

class BookChaptersStackView: UIStackView {
    
    private let chapterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Chapters"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        distribution = .fill
        spacing = 8
        layoutMargins = .init(top: 24, left: 0, bottom: 0, right: 0)
        isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(model: BookAttribute) {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let chapters = model.chapters
        addArrangedSubview(chapterLabel)
        chapters?.forEach{ [weak self] in
            guard let self else { return }
            self.addChapterSubViews(model: $0)
        }
    }
    private func addChapterSubViews(model: BookChapters) {
        let label: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.textColor = .darkGray
            label.numberOfLines = 0
            return label
        }()
        label.text = model.title
        self.addArrangedSubview(label)
    }
}
