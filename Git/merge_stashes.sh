# Aplicar solo un stash
cd /path/to/your/repo
git stash apply stash@{78}

# Ver estado
echo "Estado después de aplicar:"
git status

# Resolver conflictos de forma más segura
echo ""
echo "Archivos en conflicto:"
git diff --name-only --diff-filter=U

# Resolver cada archivo individualmente
git diff --name-only --diff-filter=U | while IFS= read -r file; do
    echo "Resolviendo: '$file'"
    
    # Usar git checkout para resolver
        # Método alternativo más seguro
	git show ":2:$file" > "${file}.current" 2>/dev/null || echo "Error extrayendo versión actual"
	git show ":3:$file" > "${file}.stash" 2>/dev/null || echo "Error extrayendo versión stash"
	
	if [ -f "${file}.current" ] && [ -f "${file}.stash" ]; then
		cat "${file}.current" "${file}.stash" > "$file"
		rm "${file}.current" "${file}.stash"
		git add "$file"
		echo "✅ Resuelto: $file"
	else
		echo "❌ Error procesando: $file"
	fi
done

# 5. Commit y continuar
git commit -m "Apply stash - <task_id>"
# git stash drop stash@{78}
