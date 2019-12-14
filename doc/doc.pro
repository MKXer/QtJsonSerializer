TEMPLATE = aux

OTHER_FILES += Doxyfile \
	makedoc.sh \
	doxme.py \
	../README.md \
	*.dox \
	snippets/*.cpp \
	images/*

mkpath($$OUT_PWD/qtjsonserializer)
!exists($$OUT_PWD/qtjsonserializer.qch):write_file($$OUT_PWD/qtjsonserializer.qch, __NOTHING)

docTarget.target = doxygen
docTarget.commands = $$PWD/makedoc.sh "$$PWD" "$$MODULE_VERSION" "$$[QT_INSTALL_BINS]" "$$[QT_INSTALL_HEADERS]" "$$[QT_INSTALL_DOCS]"
QMAKE_EXTRA_TARGETS += docTarget

docInst1.path = $$[QT_INSTALL_DOCS]
docInst1.files = $$OUT_PWD/qtjsonserializer.qch
docInst1.CONFIG += no_check_exist
docInst2.path = $$[QT_INSTALL_DOCS]
docInst2.files = $$OUT_PWD/qtjsonserializer
INSTALLS += docInst1 docInst2

DISTFILES += \
	qjsontypeconverter.dox
