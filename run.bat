@echo off
title RAG Pipeline Explainer
cd /d "%~dp0"

echo ========================================================
echo   Starting RAG Pipeline Explainer (Steps 1 to 12)
echo ========================================================
echo.

where python >nul 2>nul
if %errorlevel% equ 0 (
    echo Starting server with Python on http://localhost:8080/#s=1 ...
    start "" "http://localhost:8080/#s=1"
    python -m http.server 8080
    goto end
)

where node >nul 2>nul
if %errorlevel% equ 0 (
    echo Starting server with Node on http://localhost:8080/#s=1 ...
    start "" "http://localhost:8080/#s=1"
    npx -y serve -l 8080 .
    goto end
)

echo Neither Python nor Node was found. Opening HTML directly in your browser...
start "" "%~dp0index.html#s=1"

:end
pause
