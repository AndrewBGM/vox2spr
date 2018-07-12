@echo off
haxe build.hxml -main Main -neko "./dist/vox2spr.n"
nekotools boot "./dist/vox2spr.n"
