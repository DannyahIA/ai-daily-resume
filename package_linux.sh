#!/bin/bash
# Script para empacotar a distribuição final

VERSION="3.5"
APP_NAME="DailyMaker"

echo "=== Daily Maker - Package Script v${VERSION} ==="
echo ""

# Verificar se o executável existe
if [ ! -f "dist/${APP_NAME}" ]; then
    echo "❌ Executável não encontrado em dist/${APP_NAME}"
    echo "Execute ./build_linux.sh primeiro!"
    exit 1
fi

# Criar diretório de distribuição
DIST_DIR="${APP_NAME}-Linux-v${VERSION}"
rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}"

echo "📦 Empacotando arquivos..."

# Copiar executável
cp "dist/${APP_NAME}" "${DIST_DIR}/"

# Copiar arquivos de configuração e documentação
cp config.json "${DIST_DIR}/" 2>/dev/null || echo "{}" > "${DIST_DIR}/config.json"
cp README.md "${DIST_DIR}/"
cp CHANGELOG.md "${DIST_DIR}/"
cp BUILD_INSTRUCTIONS.md "${DIST_DIR}/"

# Criar script de início rápido
cat > "${DIST_DIR}/start.sh" << 'EOL'
#!/bin/bash
cd "$(dirname "$0")"
./DailyMaker
EOL

chmod +x "${DIST_DIR}/start.sh"
chmod +x "${DIST_DIR}/${APP_NAME}"

# Criar arquivo de informações
cat > "${DIST_DIR}/INFO.txt" << EOL
Daily Maker with AI - Version ${VERSION}
========================================

Para começar:
1. Execute: ./DailyMaker (ou clique duas vezes em start.sh)
2. Configure sua API Key do Google Gemini na aba Settings
3. Preencha seu nome
4. Clique em "Start Monitoring"

Documentação completa: README.md
Instruções de build: BUILD_INSTRUCTIONS.md
Changelog: CHANGELOG.md

Requisitos:
- API Key do Google Gemini (gratuita)
- Conexão com internet

Suporte:
- GitHub: https://github.com/DannyahIA/ai-daily-resume
- Issues: https://github.com/DannyahIA/ai-daily-resume/issues

Autor: Tavares
EOL

# Criar arquivo ZIP
ZIP_FILE="${APP_NAME}-Linux-v${VERSION}.zip"
rm -f "${ZIP_FILE}"

echo "🗜️  Comprimindo..."
zip -r "${ZIP_FILE}" "${DIST_DIR}" > /dev/null

if [ -f "${ZIP_FILE}" ]; then
    SIZE=$(du -h "${ZIP_FILE}" | cut -f1)
    echo ""
    echo "✅ Pacote criado com sucesso!"
    echo ""
    echo "📂 Diretório: ${DIST_DIR}/"
    echo "📦 Arquivo ZIP: ${ZIP_FILE} (${SIZE})"
    echo ""
    echo "Conteúdo do pacote:"
    unzip -l "${ZIP_FILE}" | grep -v "Archive:" | tail -n +2
    echo ""
    echo "Para distribuir, envie o arquivo: ${ZIP_FILE}"
else
    echo "❌ Erro ao criar arquivo ZIP"
    exit 1
fi

# Criar tarball também (alternativa ao ZIP)
TAR_FILE="${APP_NAME}-Linux-v${VERSION}.tar.gz"
rm -f "${TAR_FILE}"
tar -czf "${TAR_FILE}" "${DIST_DIR}"

if [ -f "${TAR_FILE}" ]; then
    SIZE=$(du -h "${TAR_FILE}" | cut -f1)
    echo "📦 Tarball alternativo: ${TAR_FILE} (${SIZE})"
fi

echo ""
echo "✨ Processo de empacotamento concluído!"
