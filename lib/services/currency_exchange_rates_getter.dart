import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<Map<String, double>> getExchangeRates() async {
//   Map<String, double> rates = {};
//   http.Response response = await http.get(Uri.parse('https://open.er-api.com/v6/latest/USD'));
//   const success = 200;
//   if (response.statusCode == success) {
//     final data = await jsonDecode(response.body);
//     for (var key in data['rates'].keys) {
//       rates.addAll({key: double.parse(data['rates'][key].toString())});
//     }
//   }
//   return rates;
// }

class ExchangeRates {
  ExchangeRates();
  Map<String, double> rates = {}..addAll(mockRatesDebug);
  bool hasUpdatedRates = false;
  DateTime? lastUpdated;

  Future<void> updateExchangeRates() async {
    http.Response response = await http.get(Uri.parse('https://open.er-api.com/v6/latest/USD'));

    const success = 200;
    if (response.statusCode == success) {
      rates.clear();

      final data = await jsonDecode(response.body);

      for (var key in data['rates'].keys) {
        rates.addAll({key: double.parse(data['rates'][key].toString())});
      }
      hasUpdatedRates = true;

      lastUpdated = DateTime.now();
    } else {
      hasUpdatedRates = false;
    }
  }
}

const Map<String, double> mockRatesDebug = {
  "x 1": 1,
  "x 2": 2,
  "x 3": 3,
  "x 0.75": 0.75,
  "x 0.5": 0.5,
  "x 0.25": 0.25,
};

const Map<String, double> mockRatesShortest = {
  "USD": 1,
  "BRL": 4.838416,
  "EUR": 0.915655,
  "NZD": 1.644651,
  "ARS": 254.526904,
  "CLP": 798.389523,
};

const Map<String, double> mockRatesShort = {
  "USD": 1,
  "BRL": 4.838416,
  "EUR": 0.915655,
  "NZD": 1.644651,
  "ARS": 254.526904,
  "CLP": 798.389523,
  "CAD": 1.324616,
  "CHF": 0.896639,
  "JPY": 144.288383,
  "AED": 3.6725,
  "BOB": 6.920979,
};

const Map<String, double> mockRates = {
  "USD": 1,
  "AED": 3.6725,
  "AFN": 85.987883,
  "ALL": 97.610711,
  "AMD": 386.964167,
  "ANG": 1.79,
  "AOA": 822.025551,
  "ARS": 254.526904,
  "AUD": 1.512224,
  "AWG": 1.79,
  "AZN": 1.697706,
  "BAM": 1.790912,
  "BBD": 2,
  "BDT": 108.160206,
  "BGN": 1.790609,
  "BHD": 0.376,
  "BIF": 2818.225891,
  "BMD": 1,
  "BND": 1.352621,
  "BOB": 6.920979,
  "BRL": 4.838416,
  "BSD": 1,
  "BTN": 82.062168,
  "BWP": 13.423955,
  "BYN": 2.912505,
  "BZD": 2,
  "CAD": 1.324616,
  "CDF": 2305.160931,
  "CHF": 0.896639,
  "CLP": 798.389523,
  "CNY": 7.243676,
  "COP": 4168.444265,
  "CRC": 542.870392,
  "CUP": 24,
  "CVE": 100.967313,
  "CZK": 21.662027,
  "DJF": 177.721,
  "DKK": 6.831311,
  "DOP": 55.122039,
  "DZD": 135.445966,
  "EGP": 30.877719,
  "ERN": 15,
  "ETB": 54.826975,
  "EUR": 0.915655,
  "FJD": 2.230909,
  "FKP": 0.790725,
  "FOK": 6.831311,
  "GBP": 0.790699,
  "GEL": 2.62196,
  "GGP": 0.790725,
  "GHS": 11.644799,
  "GIP": 0.790725,
  "GMD": 62.566725,
  "GNF": 8574.270691,
  "GTQ": 7.836933,
  "GYD": 211.217142,
  "HKD": 7.832659,
  "HNL": 24.605484,
  "HRK": 6.899181,
  "HTG": 138.326453,
  "HUF": 339.787582,
  "IDR": 15013.61707,
  "ILS": 3.674179,
  "IMP": 0.790725,
  "INR": 82.06218,
  "IQD": 1308.178837,
  "IRR": 41972.471649,
  "ISK": 135.717751,
  "JEP": 0.790725,
  "JMD": 154.305909,
  "JOD": 0.709,
  "JPY": 144.288383,
  "KES": 140.375757,
  "KGS": 87.421978,
  "KHR": 4122.494418,
  "KID": 1.512186,
  "KMF": 450.484395,
  "KRW": 1308.818428,
  "KWD": 0.307324,
  "KYD": 0.833333,
  "KZT": 450.609611,
  "LAK": 18932.051035,
  "LBP": 15000,
  "LKR": 307.395895,
  "LRD": 181.477715,
  "LSL": 18.661249,
  "LYD": 4.80032,
  "MAD": 9.880361,
  "MDL": 18.223267,
  "MGA": 4531.003923,
  "MKD": 56.339175,
  "MMK": 2098.393212,
  "MNT": 3446.375093,
  "MOP": 8.067628,
  "MRU": 34.522581,
  "MUR": 45.576656,
  "MVR": 15.441886,
  "MWK": 1054.699625,
  "MXN": 17.088515,
  "MYR": 4.670131,
  "MZN": 63.993601,
  "NAD": 18.661249,
  "NGN": 763.91269,
  "NIO": 36.563564,
  "NOK": 10.772824,
  "NPR": 131.299468,
  "NZD": 1.644651,
  "OMR": 0.384497,
  "PAB": 1,
  "PEN": 3.631549,
  "PGK": 3.590532,
  "PHP": 55.265867,
  "PKR": 286.023515,
  "PLN": 4.092885,
  "PYG": 7277.670995,
  "QAR": 3.64,
  "RON": 4.53645,
  "RSD": 107.281009,
  "RUB": 85.953048,
  "RWF": 1191.731621,
  "SAR": 3.75,
  "SBD": 8.502261,
  "SCR": 13.207551,
  "SDG": 586.32432,
  "SEK": 10.779802,
  "SGD": 1.352622,
  "SHP": 0.790725,
  "SLE": 18.721468,
  "SLL": 18721.467617,
  "SOS": 568.798798,
  "SRD": 38.350735,
  "SSP": 981.06206,
  "STN": 22.434128,
  "SYP": 2531.643592,
  "SZL": 18.661249,
  "THB": 35.568498,
  "TJS": 10.892947,
  "TMT": 3.498141,
  "TND": 3.089234,
  "TOP": 2.33816,
  "TRY": 26.052981,
  "TTD": 6.760949,
  "TVD": 1.512186,
  "TWD": 31.066538,
  "TZS": 2412.515213,
  "UAH": 36.924847,
  "UGX": 3672.798253,
  "UYU": 37.580997,
  "UZS": 11499.48653,
  "VES": 27.8374,
  "VND": 23552.413099,
  "VUV": 118.989846,
  "WST": 2.696445,
  "XAF": 600.64586,
  "XCD": 2.7,
  "XDR": 0.748249,
  "XOF": 600.64586,
  "XPF": 109.269772,
  "YER": 250.114969,
  "ZAR": 18.659829,
  "ZMW": 17.325988,
  "ZWL": 6345.940194
};
