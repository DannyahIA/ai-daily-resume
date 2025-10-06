@echo off
REM Script para empacotar a distribuição final para Windows

SET VERSION=3.5
SET APP_NAME=DailyMaker

echo === Daily Maker - Package Script v%VERSION% ===
echo.

REM Verificar se o executável existe
if not exist "dist\%APP_NAME%.exe" (
    echo Executavel nao encontrado em dist\%APP_NAME%.exe
    echo Execute build_windows.bat primeiro!
    exit /b 1
)

REM Criar diretório de distribuição
SET DIST_DIR=%APP_NAME%-Windows-v%VERSION%
if exist "%DIST_DIR%" rmdir /s /q "%DIST_DIR%"
mkdir "%DIST_DIR%"

echo Empacotando arquivos...

REM Copiar executável
copy "dist\%APP_NAME%.exe" "%DIST_DIR%\"

REM Copiar arquivos de configuração e documentação
if exist config.json (
    copy config.json "%DIST_DIR%\"
) else (
    echo {} > "%DIST_DIR%\config.json"
)
copy README.md "%DIST_DIR%\"
copy CHANGELOG.md "%DIST_DIR%\"
copy BUILD_INSTRUCTIONS.md "%DIST_DIR%\"

REM Criar script de início rápido
echo @echo off > "%DIST_DIR%\start.bat"
echo cd /d "%%~dp0" >> "%DIST_DIR%\start.bat"
echo %APP_NAME%.exe >> "%DIST_DIR%\start.bat"

REM Criar arquivo de informações
(
echo Daily Maker with AI - Version %VERSION%
echo ========================================
echo.
echo Para comecar:
echo 1. Execute: DailyMaker.exe ^(ou clique duas vezes em start.bat^)
echo 2. Configure sua API Key do Google Gemini na aba Settings
echo 3. Preencha seu nome
echo 4. Clique em "Start Monitoring"
echo.
echo Documentacao completa: README.md
echo Instrucoes de build: BUILD_INSTRUCTIONS.md
echo Changelog: CHANGELOG.md
echo.
echo Requisitos:
echo - API Key do Google Gemini ^(gratuita^)
echo - Conexao com internet
echo.
echo Suporte:
echo - GitHub: https://github.com/DannyahIA/ai-daily-resume
echo - Issues: https://github.com/DannyahIA/ai-daily-resume/issues
echo.
echo Autor: Tavares
) > "%DIST_DIR%\INFO.txt"

REM Criar arquivo ZIP
SET ZIP_FILE=%APP_NAME%-Windows-v%VERSION%.zip
if exist "%ZIP_FILE%" del "%ZIP_FILE%"

echo Comprimindo...

REM Usar PowerShell para criar ZIP
powershell -Command "Compress-Archive -Path '%DIST_DIR%' -DestinationPath '%ZIP_FILE%' -Force"

if exist "%ZIP_FILE%" (
    echo.
    echo Pacote criado com sucesso!
    echo.
    echo Diretorio: %DIST_DIR%\
    echo Arquivo ZIP: %ZIP_FILE%
    echo.
    echo Para distribuir, envie o arquivo: %ZIP_FILE%
    echo.
    echo Processo de empacotamento concluido!
) else (
    echo Erro ao criar arquivo ZIP
    exit /b 1
)

pause
