//
//  LocaisViagensTableViewController.swift
//  Minhas Viagens
//
//  Created by Andre Linces on 09/09/21.
//

import UIKit

class LocaisViagensTableViewController: UITableViewController {
    
    var locaisViagens: [ Dictionary<String, String> ] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    //Método criado para atualizar a tableView toda vez que a view é chamada.
    override func viewDidAppear(_ animated: Bool) {
        
        atualizaViagens()
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
        //reccupera o índice do array e o índice do dicionário
        let viagem = locaisViagens [ indexPath.row ]["local"]
        
        //Montando a célula.
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso" , for: indexPath )
        
        celula.textLabel?.text = viagem
        
        return celula
        
    }
    //Método para remover os itens marcados e salvos na tableView
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            ArmazenamentoDados().removerVIagem( indice: indexPath.row )
            atualizaViagens()
        }
        
    }
    
    func atualizaViagens (){
        
        locaisViagens = ArmazenamentoDados().listarViagem()
        tableView.reloadData()
        
    }
    

}
