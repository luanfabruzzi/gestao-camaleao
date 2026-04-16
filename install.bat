@echo off
echo ========================================================
echo    INSTALADOR GESTAO CAMALEAO PDV - CamaleaoPDV
echo ========================================================
echo.

echo Verificando se o Node.js esta instalado...
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Node.js nao encontrado!
    echo Por favor instale o Node.js LTS em: https://nodejs.org
    pause
    exit /b 1
)

echo Node.js encontrado!
echo.

echo Instalando dependencias do Monorepo (raiz)...
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao instalar dependencias da raiz.
    pause
    exit /b 1
)

echo.
echo ========================================================
echo Instalando dependencias do gc-desktop-app (Electron)...
cd gc-desktop-app
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao instalar dependencias do Desktop App.
    pause
    exit /b 1
)
cd ..

echo.
echo ========================================================
echo Instalando dependencias do gc-licensing-api...
cd gc-licensing-api
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao instalar dependencias da API de Licenciamento.
    pause
    exit /b 1
)
cd ..

echo.
echo ========================================================
echo Instalando dependencias do gc-landing-page...
cd gc-landing-page
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao instalar dependencias da Landing Page.
    pause
    exit /b 1
)
cd ..

echo.
echo ========================================================
echo ✅ Todas as dependencias foram instaladas com sucesso!
echo.
echo Proximos passos:
echo   1. Configure o arquivo .env na pasta gc-licensing-api/
echo   2. Rode "npm run dev" na raiz para iniciar tudo (se tiver script)
echo   3. Para build do desktop: cd gc-desktop-app && npm run make
echo.
echo Boa sorte com o Camaleao PDV! 🦎
echo.
pause