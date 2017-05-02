import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    // declarando um array de tuplas. com os itens que serão listados na tabela
    var images: [(name: String, image: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // preenchendo o array com 5 tuplas
        images = [("Photo 1","foto1"),("Photo 2","foto2"),("Photo 3","foto3"),("Photo 4","foto4"),("Photo 5","foto5"),("Photo 6","foto6")]
        
    }
    
    // Conformando com UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return images.count
    }
    
    // Conformando com UITableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = images[indexPath.row].name
        
        return cell
    }
    
    // a função prepareForSegue é chamada antes da transição de views, 
    // com o objetivo de preparar os dados que serão trocados
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let dtVC = segue.destinationViewController as! DetailViewController
        
        let idxPath = tableView.indexPathForCell(sender as! UITableViewCell) as NSIndexPath?
        
        dtVC.imgSelected = images[idxPath!.row].image
    }

}

