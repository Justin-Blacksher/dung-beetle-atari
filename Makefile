# Makefile for game

PPATH=E:/dung_beetle
ALTIRRA=${PPATH}/emulation/Altirra.exe
COMPILER=${PPATH}/compiler/Mad-Assembler-2.1.6/bin/windows_x86_64/mads.exe
MAIN=${PPATH}/src/main.asm
MAINOBX=${PPATH}/src/main.obx

all: compile_only
	$(ALTIRRA) $(MAINOBX)

.PHONY: git_add git_commit help push clean

compile_only:
	$(COMPILER) -l -t $(MAIN)

git_add:
	git add .

git_commit: 
	git commit -m "Commit from make. $(comment)"

help:
	@echo "compile_only			- Compiles main.asm"
	@echo "git_add				- Adds the files to staging"
	@echo "git_commit			- Adds commit. Comment with comment="

push: 
	git push



