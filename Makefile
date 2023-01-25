BUILD_TARGET = *resume*.tex

DEPS = xelatex tlmgr fmtutil-sys

build:
	ls ${BUILD_TARGET} | xargs -I {} xelatex {}

ubuntu_deps_install:
	sudo apt install texlive-full

init_tlmgr:
	if [ ! ~/texmf/tlpkg/texlive.tlpdb ]; then tlmgr init-usertree; fi

tlmgr_install: check_dependencies init_tlmgr
	tlmgr install ragged2e everysel fancyhdr xifthen ifmtarg setspace sourcesanspro tcolorbox pgf environ parskip 
	fmtutil-sys -all

check_dependencies:
	$(info Checking for: ${DEPS})
	which ${DEPS}
