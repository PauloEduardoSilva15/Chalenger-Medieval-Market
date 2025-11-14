//
//  main.swift
//  MedievalMarket
//
//  Created by PAULO EDUARDO BARBOSA DA SILVA on 14/11/25.
//

import Foundation

var items = [
    "Wood Sword": 25.0,
    "Rock Sword": 30.0,
    "Iron Sword": 50.0,
    "Diamond Sword": 100.0,
    "Wood Shield": 15.0,
    "God Sword": 500.0,
    "Health Potion": 10.0,
    "Magic Scroll": 12.0,
    "Armor": 30.0,
    "Boots": 20.0
]
var inventory = [String: Int]()

func printMenu() {

    print("--- Loja de Elro ---")
    print("digite o número da opção desejada:")
    print("1. Consultar itens disponíveis na loja")
    print("2. Consultar inventário")
    print("3. Comprar item")
    print("4. Vender ittem")
    print("5. Apostar no dado")
    print("6. Conferir dinheiro")
    print("Tecle qualquer outro número para sair da loja")
}

func displayItems() {
    print("Items disponíveis para compra:")
    for (item, price) in items {
        print("\(item): $\(price)")
    }
}
func displayInventory() {
    print("Seu inventário:")
    for (item, quantity) in inventory {
        print("\(item): \(quantity)")
    }
}
func buyItem() {
    print("Digite o nome do item da loja que deseja comprar:")
    if let itemName = readLine(), let itemPrice = items[itemName] {
        if itemPrice <= Money {
            Money -= itemPrice
            inventory[itemName, default: 0] += 1
            print("\nVocê comprou um(a) \(itemName) por J$\(itemPrice).\n")
        } else {
            print("\nVocê não tem dinheiro suficiente para comprar esse item.\n")
        }
    }else {
        print("\nItem não encontrado.\n")
    }
}

func sellItem(){
    print("Digite o nome do item que deseja vender: (Esse Item tem que está no seu inventário)")
    if let itemName = readLine(), inventory[itemName] != nil{
        print("Digite o preço do item que você quer vender em decimal:")
        if let priceText = readLine(), let price = Double(priceText){
            Money += price
            inventory[itemName, default: 0] -= 1
            print("\nVocê vendeu um(a) \(itemName) por J$\(price).\n")
        }else{
            print("\nO valor não está em decimal.\n")
        }
    }else{
        print("\nItem não encontrado no seu inventário\n")
    }
}

func rollDice(){
    print("Bem vindo a area de apostas da loja de Eron: ")
    print("Digite um numero inteiro de 1-6 e torça para que o dado caia no mesmo numero que você apostou.")
    if let valorTexto = readLine(), let valor = Int(valorTexto), case 1...6 = valor{
        let dado = Int.random(in: 1...6)
        print("\nValor sorteado: \(dado)")
        if valor == dado{
            Money += 25.0
            print("Você Venceu!!!! você ganhou J$25.0\n")
        }else{
            Money -= 50.0
            print("Você Perdeu!!!! você perdeu J$50.0\n")
        }
    }else{
        print("\nValor Inválido\n")
    }
}


var running = true



print("Digite seu nome:")
let name = readLine() ?? "Indeciso"

var Money = 100.0
print("\nBem-vindo à loja de Elro, \(name)!")
print("Você tem J$\(Money) disponíveis.")

while running {
    if Money < 0{
        Money = 0
    }
    printMenu()
    if let optionTexto = readLine(), let option = Int(optionTexto){
        switch option {
        case 1:
            displayItems()
        case 2:
            displayInventory()
        case 3:
            buyItem()
        case 4:
            sellItem()
        case 5:
            rollDice()
        case 6:
            print("Você tem J$\(Money) disponíveis.")
        default:
            running = false
        }
    } else {
        print("Opção inválida. Tente novamente.")
    }
    print("Obrigado por visitar nossa loja \(name)!!")
}



