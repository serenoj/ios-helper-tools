#!/bin/bash

# Encuentra la raíz del repositorio Git
REPO_ROOT="/path/to/your/repo"

# Cambia al directorio raiz del repositorio
cd "$REPO_ROOT"

DEVELOPMENT_BRANCH="development"
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Actualizando rama $CURRENT_BRANCH..."

# Stash: guarda cambios
git stash save "Progresos en $CURRENT_BRANCH"

# Fetch: últimos cambios en development
git fetch origin $DEVELOPMENT_BRANCH

# Determina si la rama actual está desactualizada vs. development
BEHIND=$(git rev-list HEAD..origin/$DEVELOPMENT_BRANCH --count)
if [ $BEHIND -gt 0 ]; then
	echo "Rama está atrás de development. Ejecutando Rebase..."
	git rebase origin/$DEVELOPMENT_BRANCH
	
	if [ $? -ne 0 ]; then
		echo "Rebase falló. Resolver conflictos manualmente primero. Rebase Abortado."
		git rebase --abort
		git stash pop
		exit 1
	fi
else
	echo "La rama está a día con development. No es necesario el Rebase."
fi

# Aplica los cambios en stash
git stash apply
echo "Actualización de la rama completa."
