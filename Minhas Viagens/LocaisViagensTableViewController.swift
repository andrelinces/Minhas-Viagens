//
//  LocaisViagensTableViewController.swift
//  Minhas Viagens
//
//  Created by Andre Linces on 09/09/21.
//

import UIKit

class LocaisViagensTableViewController: UITableViewController {
    
    var locaisViagens: [String] = ["Coliseu", "Torre Eifell", "Cristo Redentor"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    // Define a quantidade de itens da tabela.
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    //Define a quantidade de linhas de cada célula da tabela.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //locaisViagens = []
        return locaisViagens.count
    }

    //Define as configurações da célula e sua exibição.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let viagem = locaisViagens [ indexPath.row ]
        
        //Montando a célula.
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso" , for: indexPath )
        
        celula.textLabel?.text = viagem
        
        return celula
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}