import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var pokemon1: UILabel!
    @IBOutlet weak var pokemon2: UILabel!
    @IBOutlet weak var pokemon3: UILabel!
    @IBOutlet weak var pokemon4: UILabel!
    @IBOutlet weak var pokemon5: UILabel!
    @IBOutlet weak var pokemon6: UILabel!
    @IBOutlet weak var pokemon7: UILabel!
    @IBOutlet weak var pokemon8: UILabel!
    
    @IBOutlet weak var addPokemon: UIButton!
    @IBOutlet weak var deletePokemon: UIButton!
    let url = "https://pokeapi.co/api/v2/pokemon"
    
    @IBAction func addPokemon(_ sender: UIButton) {
        addData(from: url)
    }
    
    @IBAction func deletePokemon(_ sender: UIButton) {
        deleteData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultHideLabels()
        fetchData(from: url)
        //addLabel()
        
//        var results = [Result]
//
//        ForEach(0...5, id: \.self) { results in
//            Text("/(results)")
//        }
    }
    
    func fetchData(from url: String) {
        let url = URL(string: url)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            if(error != nil) {
                print(String(describing: error))
                return
            }
            
            var json: Pokemon
            
            do {
                json = try JSONDecoder().decode(Pokemon.self, from: data!)
//                Swift.print(json)
                
                DispatchQueue.main.async {
                    self.pokemon1.text = json.results[0].name
                    self.pokemon2.text = json.results[1].name
                    self.pokemon3.text = json.results[2].name
                    self.pokemon4.text = json.results[3].name
                    self.pokemon5.text = json.results[4].name
                    //callback: fonction que j'appelle à la suite d'un évènement
                }
            } catch {
                print(error)
                return
            }
        }
        dataTask.resume() // Commence la dataTask si elle n'est pas en marche actuellement
    }
    
//    func addLabel() {
//        let label = UILabel()
//        label.frame = CGRect(x: 114, y: 100, width: 187, height: 21) //+64
//        label.text = "Hello Swift"
//
//        self.view.addSubview(label)
//        // label.center = self.view.center
//    }
    
    func defaultHideLabels() {
        pokemon6.isHidden = true // hide
        pokemon7.isHidden = true // hide
        pokemon8.isHidden = true // hide
    }
    
    func addData(from url: String) {
        let url = URL(string: url)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            if(error != nil) {
                print(String(describing: error))
                return
            }
            
            var json: Pokemon
            
            do {
                json = try JSONDecoder().decode(Pokemon.self, from: data!)
//                Swift.print(json)
                
                DispatchQueue.main.async {
                    self.pokemon6.isHidden = false // show
                    self.pokemon6.text = json.results[5].name
                    //callback: fonction que j'appelle à la suite d'un évènement
                }
            } catch {
                print(error)
                return
            }
        }
        dataTask.resume()
    }
    
    func deleteData() {
        self.pokemon6.isHidden = true
    }
    
    struct Pokemon: Codable {
        let results: [Result]
    }
    
    struct Result: Codable {
        let name: String
        let url: String
    }
}

