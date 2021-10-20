BUILD_TARGET = *resume*.tex

DEPS = xelatex tlmgr fmtutil-sys

build:
	ls ${BUILD_TARGET} | xargs -I {} xelatex {}

tlmgr_install: check_dependencies
	tlmgr install ragged2e everysel fancyhdr xifthen ifmtarg setspace sourcesanspro tcolorbox pgf environ parskip 
	fmtutil-sys -all

check_dependencies:
	$(info Checking for: ${DEPS})
	which ${DEPS}
