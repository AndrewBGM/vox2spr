@echo off
haxe build.hxml -main Main -neko dist/adventurequest.n
nekotools boot dist/adventurequest.n
