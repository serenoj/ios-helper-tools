//
//  convertir_strings.swift.swift
//  
//
//  Created by Correa Arango on 5/15/25.
//

import Foundation

func convertStringsToJSON(inputPath: String, outputPath: String) throws {
	// Leer el contenido del archivo con encoding UTF-8
	guard let content = try? String(contentsOfFile: inputPath, encoding: .utf8) else {
		throw NSError(domain: "No se pudo leer el archivo", code: 1, userInfo: nil)
	}
	
	// Patrón para extraer claves y valores
	let pattern = #""([^"]+)"\s*=\s*"([^"]*)"\s*;"#
	let regex = try NSRegularExpression(pattern: pattern, options: [])
	
	var translations = [String: String]()
	
	// Encontrar todas las coincidencias
	let matches = regex.matches(in: content, options: [], range: NSRange(content.startIndex..., in: content))
	
	for match in matches {
		if let keyRange = Range(match.range(at: 1), in: content),
		   let valueRange = Range(match.range(at: 2), in: content) {
			let key = String(content[keyRange])
			// Obtener el valor y procesar las secuencias de escape correctamente
			var value = String(content[valueRange])
			
			// Preservar los saltos de línea literales en el texto
			// En Localizable.strings, los saltos de línea aparecen como "\\n"
			value = value.replacingOccurrences(of: "\\n", with: "\n")
			
			translations[key] = value
		}
	}
	
	// Crear la estructura correcta para Firebase con "data" como contenedor
	let firebaseStructure = ["data": translations]
	
	// Configurar las opciones para el JSON
	let jsonOptions: JSONSerialization.WritingOptions = [
		.prettyPrinted,
		.withoutEscapingSlashes
	]
	
	// Convertir a JSON preservando caracteres UTF-8
	let jsonData = try JSONSerialization.data(withJSONObject: firebaseStructure, options: jsonOptions)
	
	// Verificar que el JSON resultante es válido y contiene caracteres especiales
	if let jsonString = String(data: jsonData, encoding: .utf8) {
		print("Ejemplo de los primeros 200 caracteres del JSON:")
		print(String(jsonString.prefix(200)))
	}
	
	// Guardar el archivo con encoding UTF-8
	try jsonData.write(to: URL(fileURLWithPath: outputPath))
	
	print("Conversión completa. Se han convertido \(translations.count) entradas.")
}

// Ejemplo de uso
do {
	try convertStringsToJSON(inputPath: "/path/to/your/Localizable.strings", outputPath: "/path/to/your/Localizable.json")
} catch {
	print("Error: \(error)")
}
