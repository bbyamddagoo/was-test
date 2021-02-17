cd C:\Users\hyunbae.han\Documents\github_bbyamddagoo\was-test
dir
::SET TODAY_DATE=powershell -c "get-date -format yyyyMMdd_HHmmss
::echo %TODAY_DATE%
for /f %%i in ('powershell -c "get-date -format yyyyMMdd_HHmmss"') do set TODAY_DATE=%%i
echo %TODAY_DATE%

git add -A
git commit -m "%TODAY_DATE%"
git push

pause
