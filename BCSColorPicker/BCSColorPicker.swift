import UIKit

class BCSColorPicker: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UIGestureRecognizerDelegate {
    
    @IBInspectable
    var numberOfColorsInARow: Int = 6
    @IBInspectable
    var backgroundColor = UIColor.clearColor()
    @IBInspectable
    var width:CGFloat = 260
    @IBInspectable
    var height:CGFloat = 260
    @IBInspectable
    var radius:CGFloat = 13
    @IBInspectable
    var border:CGFloat = 3
    @IBInspectable
    var borderColor:UIColor = UIColor.whiteColor()
    var colorPalette: [UIColor] = [UIColor.blackColor(),UIColor.blueColor(),UIColor.brownColor(),UIColor.cyanColor(),UIColor.darkGrayColor()]
    
    private var overlayView = UIView()
    private var colorSelectionAction: ((UIColor, Int) -> Void)?
    private lazy var collectionView = UICollectionView()
    
    private var senderController: UIViewController?
    private var senderTransitionStyle = true
    private var senderPresentationContext = true
    private var animation = true
    
    private lazy var flowLayout:UICollectionViewFlowLayout = {
        var flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsetsZero
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        return flow
    }()
    
    class var picker: BCSColorPicker {
        struct Static {
            static let instance: BCSColorPicker = BCSColorPicker()
        }
        return Static.instance
    }

    func showColorPicker(controller: UIViewController, animated: Bool, selection: ((UIColor, Int) -> Void)){
        colorSelectionAction = selection
        senderController = controller
        senderTransitionStyle = controller.providesPresentationContextTransitionStyle
        senderPresentationContext = controller.definesPresentationContext
        animation = animated
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        self.modalPresentationStyle = .OverCurrentContext
        controller.presentViewController(self, animated: animation, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = {
            let cv = UICollectionView(frame: CGRect(x: self.view.frame.midX - (self.width*0.5), y: self.view.frame.midY - (self.height*0.5), width: self.width, height: self.height), collectionViewLayout: self.flowLayout)
            cv.backgroundColor = UIColor.clearColor()
            cv.delegate = self
            cv.dataSource = self
            cv.bounces = true
            cv.layer.borderWidth = self.border
            cv.layer.cornerRadius = self.radius
            cv.layer.borderColor = self.borderColor.CGColor
            cv.backgroundColor = self.borderColor
            cv.registerClass(BCSColorPickerCell.self, forCellWithReuseIdentifier: "colorPickerCell")
            return cv
        }()
        
        self.view.backgroundColor = UIColor.clearColor()
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.view.addSubview(blurEffectView)
        self.view.addSubview(self.collectionView)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let width:CGFloat = self.width/CGFloat(self.numberOfColorsInARow)
        return CGSizeMake(width, width)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        self.flowLayout.invalidateLayout()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return colorPalette.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("colorPickerCell", forIndexPath: indexPath) as! BCSColorPickerCell
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = backgroundColor.CGColor
        cell.backgroundColor = colorPalette[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.dismissPicker(){
            self.colorSelectionAction!(self.colorPalette[indexPath.row],indexPath.row)
        }
    }
    
    private func dismissPicker(completion: (() -> Void)?){
        self.senderController?.providesPresentationContextTransitionStyle = self.senderTransitionStyle
        self.senderController?.definesPresentationContext = self.senderPresentationContext
        self.dismissViewControllerAnimated(animation, completion: completion)
    }
    
    func adaptivePresentationStyleForPresentationController(PC: UIPresentationController!) -> UIModalPresentationStyle {
        return .None
    }

}

struct flatColors{
    static let sofRed = UIColor(rgb: 0xEC644B)
    static let chestnutRose = UIColor(rgb: 0xD24D57)
    static let pomagrante = UIColor(rgb: 0xF22613)
    static let thunderBird = UIColor(rgb: 0xD91E18)
    static let oldBrick = UIColor(rgb: 0x96281B)
    static let flamingo = UIColor(rgb: 0xEF4836)
    static let valencia = UIColor(rgb: 0xD64541)
    static let tallPoppy = UIColor(rgb: 0xC0392B)
    static let monza = UIColor(rgb: 0xCF000F)
    static let cinnabar = UIColor(rgb: 0xE74C3C)
    static let razzmatazz = UIColor(rgb: 0xDB0A5B)
    static let sunsetOrange = UIColor(rgb: 0xF64747)
    static let waxFlower = UIColor(rgb: 0xF1A9A0)
    static let cabaret = UIColor(rgb: 0xD2527F)
    static let newYorkPink = UIColor(rgb: 0xE08283)
    static let radicalRed = UIColor(rgb: 0xF62459)
    static let sunglo = UIColor(rgb: 0xE26A6A)
    static let snuff = UIColor(rgb: 0xDCC6E0)
    static let rebeccaPurple = UIColor(rgb: 0x663399)
    static let honeyFlower = UIColor(rgb: 0x674172)
    static let wistful = UIColor(rgb: 0xAEA8D3)
    static let plum = UIColor(rgb: 0x913D88)
    static let seance = UIColor(rgb: 0x9A12B3)
    static let mediumPurple = UIColor(rgb: 0xBF55EC)
    static let lightWisteria = UIColor(rgb: 0xBE90D4)
    static let studio = UIColor(rgb: 0x8E44AD)
    static let wisteria = UIColor(rgb: 0x9B59B6)
    static let sanMarino = UIColor(rgb: 0x446CB3)
    static let aliceBlue = UIColor(rgb: 0xE4F1FE)
    static let royalBlue = UIColor(rgb: 0x4183D7)
    static let pictonBlue = UIColor(rgb: 0x59ABE3)
    static let curiousBlue = UIColor(rgb: 0x3498DB)
    static let madison = UIColor(rgb: 0x2C3E50)
    static let dodgerBlue = UIColor(rgb: 0x19B5FE)
    static let ming = UIColor(rgb: 0x336E7B)
    static let ebonyClay = UIColor(rgb: 0x22313F)
    static let malibu = UIColor(rgb: 0x6BB9F0)
    static let summerSky = UIColor(rgb: 0x1E8BC3)
    static let chambray = UIColor(rgb: 0x3A539B)
    static let pickledBluewood = UIColor(rgb: 0x34495E)
    static let hoki = UIColor(rgb: 0x67809F)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
    static let  = UIColor(rgb: 0x)
}

extension UIColor{
    convenience init(rgb: Int) {
        let r = CGFloat((rgb & 0xFF0000) >> 16)/255
        let g = CGFloat((rgb & 0xFF00) >> 8)/255
        let b = CGFloat(rgb & 0xFF)/255
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

