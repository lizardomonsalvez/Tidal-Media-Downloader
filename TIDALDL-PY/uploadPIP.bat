REM cd to workdir
cd  %~dp0

REM remove old dir
rmdir /s/q dist
rmdir /s/q build
rmdir /s/q exe
rmdir /s/q tidal_dl.egg-info
mkdir exe

REM pack
python setup.py sdist bdist_wheel

REM creat exe file
pyinstaller -F tidal_dl/__init__.py

REM rename exe name
cd dist
ren __init__.exe tidal-dl.exe
move tidal-dl.exe ../exe/
cd ..

REM upload version to pip server
twine upload dist/*

