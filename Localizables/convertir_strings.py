import json
import re

def convert_strings_to_json(input_file, output_file):
    # Patrón para extraer claves y valores (preservando los saltos de línea)
    pattern = r'"([^"]+)"\s*=\s*"([^"]*)";'
    
    translations = {}
    
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
        
        # Buscar todas las coincidencias en el contenido
        matches = re.findall(pattern, content)
        
        # Crear diccionario con las coincidencias
        for key, value in matches:
            # Preservar los caracteres de escape originales como \n
            value = value.replace('\\n', '\n')
            translations[key] = value
    
    # Crear la estructura correcta para Firebase con "data" como contenedor
    firebase_structure = {
        "data": translations
    }
    
    # Guardar como JSON con configuración especial para preservar caracteres
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(firebase_structure, f, ensure_ascii=False, indent=2)
    
    return translations

# Ejemplo de uso
if __name__ == "__main__":
    input_file = "/path/to/your/Localizable.strings"
    output_file = "/path/to/your/Localizable.json"
    
    result = convert_strings_to_json(input_file, output_file)
    print(f"Conversión completa. Se han convertido {len(result)} entradas.")
