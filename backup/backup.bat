@echo off
date /t
set date=
for /F "tokens=1-3 delims=/ " %%a in ('date /T') do set date=%%c%%b%%a
echo .%date%.

time /t
set time=
for /F "tokens=1-3 delims=: " %%a in ('time /T') do set time=%%c%%a%%b
echo %time%

set date_time=
set date_time=%date%_%time%
echo %date_time%

SET MYSQL_PATH="C:\Arquivos de programas\MySQL\MySQL Server 5.1"
SET MYSQL_USER=root   
SET MYSQL_PASS=   
  
SET MYSQL_HOST=localhost   
SET MYSQL_PORT=3306   
  
REM AQUI SEMPRE USAR A BARRA INVERTIDA (/)   
SET ARQUIVO=D:/BackupIndx/INDX_%date_time%.sql
  
SET MYSQL_DATABASE=rin_indx  

%MYSQL_PATH%\bin\mysqldump.exe -v -v -v --host=%MYSQL_HOST% --user=%MYSQL_USER% --password=%MYSQL_PASS% --port=%MYSQL_PORT% --protocol=tcp --force --allow-keywords --compress  --add-drop-table --default-character-set=latin1 --hex-blob --result-file=%ARQUIVO% %MYSQL_DATABASE%
