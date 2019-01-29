import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    var tables: [TableSample] = []
    
    var tableElements = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        slides = createSlides()
        
        tables = createTable()
        setupSlideScrollView(slides: tables)
        
        pageControl.numberOfPages = tables.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)
    }

    @IBAction func segmentChanged(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            self.scrollToPage(0)
        case 1:
            self.scrollToPage(1)
        case 2:
            self.scrollToPage(2)
        default:
            self.scrollToPage(0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createTable() -> [TableSample] {
        let table1: TableSample = Bundle.main.loadNibNamed("TableSample", owner: self, options: nil)?.first as! TableSample
        table1.tableElementArray.removeAll()
        table1.tableElementArray.append("bu1")
        table1.tableIndex = 0
        table1.tableView.reloadData()
        
        
        let table2: TableSample = Bundle.main.loadNibNamed("TableSample", owner: self, options: nil)?.first as! TableSample
        table2.tableElementArray.removeAll()
        table2.tableElementArray.append("bu 2")
        table2.tableElementArray.append("bu 2.5")
        table2.tableIndex = 1
        table2.tableView.reloadData()
        
        let table3: TableSample = Bundle.main.loadNibNamed("TableSample", owner: self, options: nil)?.first as! TableSample
        table3.tableElementArray.removeAll()
        table3.tableElementArray.append("bu 3")
        table3.tableIndex = 2
        table3.tableView.reloadData()
        
        return [table1, table2, table3]
    }
    
    func setupSlideScrollView(slides : [TableSample]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollToPage(_ page: Int) {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(page)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        print(Int(pageIndex))
        self.segment.selectedSegmentIndex = Int(pageIndex)
    }
    
}

