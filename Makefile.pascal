# erzeugt Dienstag, 08. August 2023 17:00 (C) 2023 von Leander Jedamus
# modifiziert Donnerstag, 07. Dezember 2023 14:23 von Leander Jedamus
# modifiziert Dienstag, 05. Dezember 2023 00:54 von Leander Jedamus
# modifiziert Mittwoch, 15. November 2023 11:48 von Leander Jedamus
# modifiziert Donnerstag, 09. November 2023 08:53 von Leander Jedamus
# modifiziert Mittwoch, 09. August 2023 11:52 von Leander Jedamus
# modifiziert Dienstag, 08. August 2023 21:06 von Leander Jedamus

PC		    := fpc # free pascal compiler

define compile.p
$(RM) $@
$(strip $(PC) $(PFLAGS) $<)
endef

%.p %.pas %.pp:

%.o:		    %.pas
		    $(compile.p)

%.o:		    %.pp
		    $(compile.p)

%.o:		    %.p
		    $(compile.p)

%.rsj:		    %.pas
		    $(compile.p)

%.rsj:		    %.pp
		    $(compile.p)

%.rsj:		    %.p
		    $(compile.p)

# vim:ai sw=2 noexpandtab

