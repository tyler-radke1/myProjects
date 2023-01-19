
import UIKit

class FurnitureDetailViewController: UIViewController {
    
    var furniture: Furniture?
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    init?(coder: NSCoder, furniture: Furniture?) {
        self.furniture = furniture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            photoImageView.image = image
        } else {
            photoImageView.image = nil
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        let choosePhotoAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelChoosePhoto = UIAlertAction(title: "Cancel", style: .cancel)
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        
        
        let chooseFromLibrary = UIAlertAction(title: "Choose from Photo Library", style: .destructive) { UIAlertAction in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        choosePhotoAlert.addAction(chooseFromLibrary)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takePicture = UIAlertAction(title: "Take Picture", style: .default) { UIAlertAction in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
                
            }
            choosePhotoAlert.addAction(takePicture)
        }
       
        
        
        
        choosePhotoAlert.addAction(cancelChoosePhoto)
        
        
        
        
        present(choosePhotoAlert, animated: true)
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        guard let image = photoImageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activityController, animated: true)
    }
    
}


extension FurnitureDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        selectedImage.jpegData(compressionQuality: 0.9)
        
        photoImageView.image = selectedImage
        
        dismiss(animated: true)
       
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
