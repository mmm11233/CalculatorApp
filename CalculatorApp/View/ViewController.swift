import UIKit

class CalculatorViewController: UIViewController {
    private let displayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 60))
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "0"
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 180, width: 60, height: 60))
        button.setTitle("1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    private func setUpButtons() {
        let buttonText = [
            ["7", "8", "9", "/"],
            ["4", "5", "6", "*"],
            ["1", "2", "3", "-"],
            ["0", "C", "=", "+"]
        ]
    }
}

