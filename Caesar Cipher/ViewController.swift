import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var inputTextField: UITextField!  //input text field
    @IBOutlet var cipherResult: UILabel!        //label to show encrypted result
    @IBOutlet weak var picker: UIPickerView!    //picker
    @IBOutlet weak var encryptButton: UIButton! //encryption button
    
    var alphabet = [Character]()        //alphabet array
    var chosenPickerRow: Int!           //chosen picker element
    var inputText: String!              //contains input from input field
    let pickerData = ["1", "2", "3"]    //picker data array
    var encryptedInput: String!         //encrypted input text
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenPickerRow = 1     //initial picker item should be 1
        inputText = ""          //initial input text is empty
        encryptedInput = ""     //initial encrypted input is empty
        initAlphabet()          //initialize alphabet
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
        inputText = textField.text
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
        Unicode conversion credit: http://keitaito.com/blog/2017/01/06/converting-character-tounicode-scalar-value-in-swift.html
    */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenPickerRow = row + 1
    }
    
    /**
        Action function that encrypts text in input textfield
    */
    @IBAction func encrypt(_ sender: UIButton) {
        
        encryptedInput = ""
        for i in inputText.characters {
            let unicodeScalar = ("\(i)").unicodeScalars.map { $0.value }.reduce(0, +)
            var integerOfScalar = Int(unicodeScalar)
            integerOfScalar += chosenPickerRow
            encryptedInput.append(Character(UnicodeScalar(integerOfScalar)!))
        }
        
        cipherResult.text = encryptedInput
    }
}
