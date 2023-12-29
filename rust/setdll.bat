@echo off
echo remove old rust.dll
if exist "..\assets\rust.dll" (
    del "..\assets\rust.dll"
    if errorlevel 1 (
        echo fail
        exit /b 1
    )
) else (
    echo not find rust.dll
)

echo copy rust.dll
copy ".\target\release\rust.dll" "..\assets\"
if errorlevel 1 (
    echo copy rust.dll
    exit /b 1
)

echo complete
