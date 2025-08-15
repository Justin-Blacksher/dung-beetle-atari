# Makefile for game

ALTIRRA="/emulation/Altirra.exe"
COMPILER="/compiler/Mad-Assembler-2.1.6/bin/windows_x86_64/mads.exe"
MAIN="/src/main.asm"


compile_only:
	$(COMPILER) -l -t $(MAIN)

git_add:
	git add .

git_commit: git_add
	git commit -m "Commit from make. $(comment)"

help:
	@echo "compile_only			- Compiles main.asm"
	@echo "git_add				- Adds the files to staging"
	@echo "git_commit			- Adds commit. Comment with comment="

push: git_add git_commit
	git push -u origin master