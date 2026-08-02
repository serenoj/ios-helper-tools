import Foundation

struct secretToObfuscate {
	let varName: String
	let environmentCheckName: String
	
}
var secretsDictionary: [String: String] = [:]

secretsDictionary["Sample appId QA"] = "1:000000000000:ios:0000000000000000"

// MARK: - Sample Legal Terms
secretsDictionary["TYC legalBasePath"] = "https://app-dev.example.com"
secretsDictionary["TYC termsPath"] = "/api/terms"
secretsDictionary["TYC termsUserPath"] = "/api/terms/user"

secretsDictionary["TYC generalTYCUrl_Release"] = "https://firebasestorage.googleapis.com/v0/b/your-app.appspot.com/o/TYC.html?alt=media&token=00000000-0000-0000-0000-000000000000"

secretsDictionary["Promotional Banners List URL"] = "gs://your-app.appspot.com/Home/PromoBannerParameters.json"


// Obfuscation
for secretString in secretsDictionary {

	let valueString = secretString.value
	if let valueData = valueString.data(using: .utf8) {
		let byteArray = [UInt8](valueData)
		
		print(secretString.key)
		print(secretString.value)
		print(byteArray)
		let datas = Data(byteArray)
		if let decodedString = String(data: datas, encoding: .utf8) {
			print(decodedString) // Esto imprimirá: el string original
		} else {
			print("No se pudo decodificar la cadena.")
		}
		print("----------------------------------\n")
	}
}
