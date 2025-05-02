@echo off
setlocal

set FILE=%1
set EXT=%~x1

if "%EXT%"==".c" (
    gcc "%FILE%" -o output.exe && output.exe
) else if "%EXT%"==".cpp" (
    g++ "%FILE%" -o output.exe && output.exe
) else if "%EXT%"==".py" (
    python "%FILE%"
) else if "%EXT%"==".java" (
    javac "%FILE%" && java "%~n1"
) else if "%EXT%"==".rs" (
    rustc "%FILE%" && "%~n1".exe
) else (
    echo Unsupported file type: %EXT%
)

endlocal
