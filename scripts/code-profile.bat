@echo off
setlocal

:: Launch the VS Code development build with an isolated profile:
:: a dedicated user data dir and extensions dir, completely separate from
:: the default "code-oss-dev" instance, so experiments can be wiped safely.
::
:: Usage:
::   scripts\code-profile.bat [extra VS Code args...]
::
:: Examples:
::   scripts\code-profile.bat
::   scripts\code-profile.bat --profile SmokeTest
::   scripts\code-profile.bat D:\some\folder
::
:: The profile lives in %USERPROFILE%\.vscode-dev-profile by default.
:: Override with VSCODE_DEV_PROFILE_ROOT before calling this script.

if not defined VSCODE_DEV_PROFILE_ROOT set "VSCODE_DEV_PROFILE_ROOT=%USERPROFILE%\.vscode-dev-profile"

call "%~dp0code.bat" --user-data-dir "%VSCODE_DEV_PROFILE_ROOT%\user-data" --extensions-dir "%VSCODE_DEV_PROFILE_ROOT%\extensions" %*
exit /b %ERRORLEVEL%
