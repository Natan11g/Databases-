import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageSelect: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageSelect.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageSelect.addGestureRecognizer(gesture)
    
       
    }
    
    @objc func pickImage(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageSelect.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedUploadButton(_ sender: Any) {
    }
    

}
