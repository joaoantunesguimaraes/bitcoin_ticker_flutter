import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  // Atributos - Constantes
  final String url;
  // Construtor
  NetworkHelper(this.url);


  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      // Retorna "rate" desta moeda virtual
      return decodedData['rate'].toStringAsFixed(0);
    } else {
       throw 'Problem with the get request';
    }
  }
}



// // Check that the request was successful.
// if (response.statusCode == 200) {
// // Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
// var decodedData = jsonDecode(response.body);
// double price = decodedData['rate'];
// cryptoPrices[crypto] = price.toStringAsFixed(0);
// } else {
// throw 'Problem with the get request';
// }