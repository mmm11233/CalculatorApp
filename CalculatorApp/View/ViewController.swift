import UIKit

class CalculatorViewController: UIViewController {
    
    private let receivedLabel = UILabel()
    private var buttons: [UIButton] = []
    
    private var currentInput = ""
    private var previousValue: Double?
    private var currentOperation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupReceivedLabel()
        setupButtons()
    }
    
    private func setupReceivedLabel() {
        receivedLabel.frame = CGRect(x: 20, y: 90, width: view.frame.width - 40, height: 70)
        receivedLabel.backgroundColor = .systemGray2
        receivedLabel.textAlignment = .right
        receivedLabel.font = UIFont.systemFont(ofSize: 32)
        receivedLabel.text = "0"
        view.addSubview(receivedLabel)
    }
    
    private func setupButtons() {
        let titles = [
            ["7", "8", "9", "/"],
            ["4", "5", "6", "*"],
            ["1", "2", "3", "-"],
            ["0", "C", "=", "+"]
        ]
        
        let buttonSize: CGFloat = 75
        let spacing: CGFloat = 18
        let startX: CGFloat = 20
        var yOffset: CGFloat = 180
        
        for row in titles {
            var xOffset = startX
            for title in row {
                let button = UIButton(frame: CGRect(x: xOffset, y: yOffset, width: buttonSize, height: buttonSize))
                button.setTitle(title, for: .normal)
                button.backgroundColor = .systemBlue
                button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
                button.layer.cornerRadius = 10
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                view.addSubview(button)
                buttons.append(button)
                xOffset += buttonSize + spacing
            }
            yOffset += buttonSize + spacing
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let tappedButtonTitle = sender.currentTitle else { return }
        
        switch tappedButtonTitle {
        case "0"..."9":
            currentInput += tappedButtonTitle
            receivedLabel.text = currentInput
        case "+", "-", "*", "/":
            if let value = Double(currentInput) {
                previousValue = value
                currentInput = ""
                currentOperation = tappedButtonTitle
            }
        case "=":
            if let operation = currentOperation,
               let prevValue = previousValue,
               let currentValue = Double(currentInput) {
                var result: Double?
                
                switch operation {
                case "+": result = prevValue + currentValue
                case "-": result = prevValue - currentValue
                case "*": result = prevValue * currentValue
                case "/": result = currentValue == 0 ? nil : prevValue / currentValue
                default: break
                }
                
                if let currentResult = result {
                    receivedLabel.text = String(currentResult)
                } else {
                    receivedLabel.text = "Error"
                }
                
                currentInput = ""
                previousValue = nil
                currentOperation = nil
            }
        case "C":
            currentInput = ""
            previousValue = nil
            currentOperation = nil
            receivedLabel.text = "0"
        default:
            break
        }
    }
}
