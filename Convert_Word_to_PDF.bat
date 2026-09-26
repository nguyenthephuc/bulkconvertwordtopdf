@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set SOFFICE="C:\Program Files\LibreOffice\program\swriter.exe"
set GS="C:\Program Files\gs\gs10.08.0\bin\gswin64c.exe"
set INPUT=%~dp0Word
set OUTPUT=%~dp0PDF
set MERGED=%~dp0Merged.pdf

:START
cls
echo =============================
echo   WORD ^> PDF CONVERTER
echo =============================
echo.

rem --- Kiem tra LibreOffice ---
if not exist %SOFFICE% (
    echo [LOI] Khong tim thay LibreOffice tai:
    echo       %SOFFICE%
    echo Vui long kiem tra lai duong dan cai dat.
    pause
    exit /b 1
)

rem --- Kiem tra Ghostscript ---
if not exist %GS% (
    echo [LOI] Khong tim thay Ghostscript tai:
    echo       %GS%
    echo Vui long cai Ghostscript tai: https://ghostscript.com/releases/gsdnld.html
    echo hoac chinh lai duong dan bien GS cho dung phien ban da cai.
    pause
    exit /b 1
)

rem --- Kiem tra thu muc dau vao ---
if not exist "%INPUT%" (
    echo [LOI] Khong tim thay thu muc dau vao:
    echo       %INPUT%
    pause
    exit /b 1
)

if not exist %OUTPUT% mkdir %OUTPUT%

set /a TOTAL=0
for %%F in ("%INPUT%\*.doc" "%INPUT%\*.docx") do (
    set /a TOTAL+=1
)

if %TOTAL%==0 (
    echo Khong tim thay file .doc hoac .docx nao trong thu muc dau vao.
    pause
    exit /b 1
)

echo Tong so file can convert: %TOTAL%
echo.

set /a COUNT=0

for %%F in ("%INPUT%\*.doc" "%INPUT%\*.docx") do (
    set /a COUNT+=1
    echo [!COUNT!/%TOTAL%] Dang convert: %%~nxF
    %SOFFICE% --headless --invisible --nologo --nodefault --norestore --convert-to pdf --outdir %OUTPUT% "%%F"
)

echo.
echo Dang gop cac file PDF thanh 1 file...

set FILELIST=
for %%P in ("%OUTPUT%\*.pdf") do (
    set FILELIST=!FILELIST! "%%P"
)

start "" /b /wait %GS% -dNOPAUSE -dBATCH -dQUIET -sDEVICE=pdfwrite -sOutputFile="%MERGED%" !FILELIST!

if exist "%MERGED%" (
    echo.
    echo Da convert %COUNT%/%TOTAL% file.
    echo File gop: %MERGED%

    echo.
    echo Dang xoa cac file PDF le trong %OUTPUT% ...
    del /q "%OUTPUT%\*.pdf"
    echo Da xoa xong.
) else (
    echo.
    echo [LOI] Gop file PDF that bai. Vui long kiem tra lai Ghostscript.
    echo Cac file PDF le van duoc giu lai trong %OUTPUT% de kiem tra.
)

echo.
echo =============================
choice /c 01 /n /m "Bam 0 de thoat, Bam 1 de tiep tuc: "

if errorlevel 2 goto START
if errorlevel 1 exit /b 0