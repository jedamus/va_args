/* -*- C -*- */
/* minmax.h */
/* erzeugt Montag, 17. Juli 2023 13:56 (C) 2023 von Leander Jedamus */
/* modifiziert Montag, 25. September 2023 08:05 von Leander Jedamus */
/* modifiziert Dienstag, 19. September 2023 18:38 von Leander Jedamus */
/* modifiziert Samstag, 02. September 2023 11:09 von Leander Jedamus */
/* modifiziert Dienstag, 15. August 2023 14:19 von Leander Jedamus */
/* modifiziert Mittwoch, 26. Juli 2023 08:23 von Leander Jedamus */
/* modifiziert Dienstag, 18. Juli 2023 07:27 von Leander Jedamus */
/* modifiziert Montag, 17. Juli 2023 13:57 von Leander Jedamus */

#ifndef MINMAX_H
#define MINMAX_H 1

#include <limits.h>

#if defined __linux__
  /* Minimum and maximum values a `signed long long int' can hold.  */
  #define LLONG_MAX    9223372036854775807LL
  #define LLONG_MIN    (-LLONG_MAX - 1LL)
#endif

#include "types.h"

/* #define SHORT  1 */
#define LONG  1
#define SIGNED 1

#ifdef SHORT
  #ifdef SIGNED
    #define RUECKGABE    ssint
    #define PRIRUECKGABE "d"
    #define SCNRUECKGABE "hd"
    #define RUECKGABE_MIN SHRT_MIN
    #define RUECKGABE_MAX SHRT_MAX
  #else
    #define RUECKGABE    usint
    #define PRIRUECKGABE "hd"
    #define SCNRUECKGABE "hd"
    #define RUECKGABE_MIN 0
    #define RUECKGABE_MAX USHRT_MAX
  #endif
#else
  #ifdef LONG
    #ifdef SIGNED
      #define RUECKGABE    sll
      #define PRIRUECKGABE PRIsll
      #define SCNRUECKGABE SCNsll
      #define RUECKGABE_MIN LLONG_MIN
      #define RUECKGABE_MAX LLONG_MAX
    #else
      #define RUECKGABE    ull
      #define PRIRUECKGABE PRIull
      #define SCNRUECKGABE SCNull
      #define RUECKGABE_MIN 0
      #define RUECKGABE_MAX __LONG_LONG_MAX__
    #endif
  #else
    #ifdef SIGNED
      #define RUECKGABE    sint
      #define PRIRUECKGABE "d"
      #define SCNRUECKGABE "d"
      #define RUECKGABE_MIN INT_MIN
      #define RUECKGABE_MAX INT_MAX
    #else
      #define RUECKGABE    uint
      #define PRIRUECKGABE "d"
      #define SCNRUECKGABE "d"
      #define RUECKGABE_MIN 0
      #define RUECKGABE_MAX UINT_MAX
    #endif
  #endif
#endif

extern RUECKGABE max(CONST ull zahlen, ...); 
extern RUECKGABE min(CONST ull zahlen, ...); 

#endif /* MINMAX_H */

/* vim:set cindent ai sw=2 */

