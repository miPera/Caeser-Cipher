import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var cipherResult: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    let pickerData = ["1", "2", "3"]
    var alphabet = [Character]()            //alphabet array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAlphabet()
    }
    
    /**
        Initialize array of characters from the English alphabet
    */
    func initAlphabet () {
        alphabet = (97...122).map({Character(UnicodeScalar($0))})
    }
    
    /**
        Action function that responds to text being input by user in text field.
    */
    @IBAction func inputTextFieldChanged(_ textField: UITextField) {
        cipherResult.text = textField.text
    }
    
    /**
        Returns number of columns (components) in picker view
    */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /**
        Returns title for each row
    */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    /**
        Returns number of rows in picker view
    */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    /**
        Detects element selected in picker view
    */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
