//
//  ArmazenamentoDados.swift
//  Minhas Viagens
//
//  Created by Andre Linces on 11/09/21.
//

import UIKit
//Classe responsável por salvar os dados no disposito, listar ou remover os itens marcados da tableView
class ArmazenamentoDados {
    
    let chaveArmazenamento = "locaisViagens"
    //Criando array de dicionário para armazenar a informação do nome, endereço (latitude e longitude)
    var viagens: [ Dictionary<String,String> ] = []
    
    //Método userDefaults criado pois vamos utilizar para salvar, listar e remover as viagens
    func getDefaults () -> UserDefaults{
        return UserDefaults.standard
    }
    
    
    //Método salva a viagem (ponto selecionado) dentro do array viagens
    func salvarViagem( viagem: Dictionary<String,String> ){
        
        //array viagens vai receber inicialmente o listar viagens para não sobrescrever os itens anteriores
        viagens = listarViagem()
        
        viagens.append(viagem)
        getDefaults().setValue(viagens, forKey: chaveArmazenamento)
        //Sincronizando os dados automaticamente
        getDefaults().synchronize()
    }
    
    func listarViagem() -> [ Dictionary<String,String> ] {
        //Criado constante para receber o item salvo no array, testar se tem o item, se tiver retorna, senão retorna o array vazio
        let dados = getDefaults().object(forKey: chaveArmazenamento)
        if dados != nil{
            return dados as! Array
        }else{
            return []
        }
    }
    
    func removerVIagem( indice: Int ){
        
        viagens = listarViagem()
        viagens.remove(at: indice)
        
        getDefaults().setValue(viagens, forKey: chaveArmazenamento)
        //Sincronizando os dados automaticamente
        getDefaults().synchronize()
        
        
    }
    
}
