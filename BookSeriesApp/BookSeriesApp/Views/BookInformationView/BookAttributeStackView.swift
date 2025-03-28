import UIKit

final class BookAttributeStackView: UIStackView {
    
    private var contentIndex: [AttributeContentType] = [.author, .released, .pages]
    
    enum AttributeContentType: String {
        case author
        case released
        case pages
        
        func configuration(model: BookAttribute) -> [(title: String, font: UIFont, textColor: UIColor)] {
            switch self {
            case .author:
                return [("Author",
                         UIFont.systemFont(ofSize: 16, weight: .bold),
                         UIColor.black),
                        (model.author,
                         UIFont.systemFont(ofSize: 18, weight: .regular),
                         UIColor.darkGray)]
            case .released:
                return [("Released",
                         UIFont.systemFont(ofSize: 14, weight: .bold),
                         UIColor.black),
                        (model.releaseDate,
                         UIFont.systemFont(ofSize: 14, weight: .regular),
                         UIColor.gray)]
            case .pages:
                return [("Pages",
                         UIFont.systemFont(ofSize: 14, weight: .bold),
                         UIColor.black),
                        ("\(model.pages)",
                         UIFont.systemFont(ofSize: 14, weight: .regular),
                         UIColor.gray)]
            }
        }
    }
    
    private func makeAttributeContentView(attribute: String, model: BookAttribute) -> UIStackView {
        let type = AttributeContentType(rawValue: attribute)
        let configuration = type?.configuration(model: model)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .center
        let titleLabel = UILabel()
        let attributeLabel = UILabel()
        
        titleLabel.text = configuration?[0].title
        titleLabel.font = configuration?[0].font
        titleLabel.textColor = configuration?[0].textColor
        
        attributeLabel.text = configuration?[1].title
        attributeLabel.font = configuration?[1].font
        attributeLabel.textColor = configuration?[1].textColor
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(attributeLabel)
        
        return stackView
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Harry Potter and the Philosopher's Stone"
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        distribution = .fillProportionally
        alignment = .top
        spacing = 10
        addViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addViews() {
        addArrangedSubview(titleLabel)
//        contentIndex.forEach { type in
//            let stackView = makeAttributeContentView(attribute: type.rawValue)
//            addArrangedSubview(stackView)
//        }
    }
    func bind(model: BookAttribute) {
        contentIndex.forEach { type in
            let stackView = makeAttributeContentView(attribute: type.rawValue, model: model)
            addArrangedSubview(stackView)
        }
    }
    
}
