import '../models/model.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: "images/bitcoin-btc-logo.png", 
      nome: "Bitcoin", 
      sigla: "BTC", 
      preco: 164603.00
    ),
    Moeda(
      icone: "images/bnb-bnb-logo.png", 
      nome: "Binance BNB", 
      sigla: "BNB", 
      preco: 1111.00
    ),
    Moeda(
      icone: "images/shiba-inu-shib-logo.png", 
      nome: "Shiba Inu", 
      sigla: "SHIB", 
      preco: 2222.00
    ),
    Moeda(
      icone: "images/dogecoin-doge-logo.png", 
      nome: "Dogecoin", 
      sigla: "Doge", 
      preco: 3333.00
    ),
    Moeda(
      icone: "images/ethereum-eth-logo.png", 
      nome: "Ethereum", 
      sigla: "ETH", 
      preco: 4444.00
    ),
  ];
}