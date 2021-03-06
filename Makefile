SUBDIRS = src
DISTCLEAN = extra.mk buildsys.mk config.log config.status libguess.pc

include buildsys.mk

install-extra:
	i="libguess.pc"; \
	${INSTALL_STATUS}; \
	if ${MKDIR_P} ${DESTDIR}${libdir}/pkgconfig && ${INSTALL} -m 644 $$i ${DESTDIR}${libdir}/pkgconfig/$$i; then \
		${INSTALL_OK}; \
	else \
		${INSTALL_FAILED}; \
	fi

uninstall-extra:
	i="libguess.pc"; \
	if [ -f ${DESTDIR}${libdir}/pkgconfig/$$i ]; then \
		if rm -f ${DESTDIR}${libdir}/pkgconfig/$$i; then \
			${DELETE_OK}; \
		else \
			${DELETE_FAILED}; \
		fi \
	fi
