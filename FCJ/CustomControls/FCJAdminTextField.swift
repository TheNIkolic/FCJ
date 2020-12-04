//
//  FCJAdminTextField.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let fieldPaddingViewFrame: CGRect =  CGRect(origin: .zero, size: CGSize(width: 20, height: 30))
}

class FCJAdminTextField: UITextField {
    
    private let titleLabel: FCJLabel = FCJLabel()

    private var validationBlock: ((String) -> Bool)? = nil
    
    var fieldTitle: String = "" {
        didSet {
            titleLabel.text = fieldTitle
        }
    }

    public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func addValidation(_ action: @escaping (String) -> Bool) {
        validationBlock = action
    }
    
    func validateInput() -> Bool {
        if let validation = validationBlock {
            var isValid = false
            if let inputText = self.text {
                isValid = validation(inputText)
            }
            return isValid
        }
        return true
    }
    
    private func setup() {
        autocorrectionType = .no
        autocapitalizationType = .none
        backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(AlphaComponent.regular)
        layer.cornerRadius = Sizes.CornerRadius.small
        font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        leftView = UIView(frame: Constants.fieldPaddingViewFrame)
        leftViewMode = .always
        
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: FontSize.small)
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalTo(self.snp.top).inset(Margins.tiny * -1)
        }
    }
}
