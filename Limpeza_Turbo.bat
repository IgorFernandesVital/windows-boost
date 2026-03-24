@echo off
title Limpador de Sistema - Igor
echo ============================================
echo Iniciando limpeza profunda do sistema...
echo ============================================

:: Limpando pastas temporárias
echo [1/5] Limpando arquivos temporarios...
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
del /s /f /q C:\WINDOWS\Temp\*.*
rd /s /q C:\WINDOWS\Temp
md C:\WINDOWS\Temp
del /s /f /q C:\Windows\Prefetch\*.*

:: Limpando Cache de DNS
echo [2/5] Limpando Cache de DNS...
ipconfig /flushdns

:: Limpando arquivos de atualizações antigas (DISM)
echo [3/5] Otimizando imagem do Windows (pode demorar)...
dism /online /cleanup-image /startcomponentcleanup /quiet

:: Executando Limpeza de Disco silenciosa
echo [4/5] Executando Cleanmgr...
cleanmgr /sagerun:1

:: Otimizando o Drive C (TRIM para SSD ou Defrag para HD)
echo [5/5] Otimizando unidade C...
powershell.exe -Command "Optimize-Volume -DriveLetter C -ReTrim -Verbose"

echo ============================================
echo Limpeza concluida com sucesso!
echo ============================================
pause