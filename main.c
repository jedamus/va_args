/* -*- C -*- */
/* main.c */
/* erzeugt Freitag, 07. Juli 2023 12:05 (C) 2023 von Leander Jedamus */
/* modifiziert Samstag, 24. August 2024 14:28 von Leander Jedamus */
/* modifiziert Freitag, 23. Februar 2024 07:50 von Leander Jedamus */
/* modifiziert Donnerstag, 22. Februar 2024 17:43 von Leander Jedamus */
/* modifiziert Montag, 25. September 2023 07:38 von Leander Jedamus */
/* modifiziert Dienstag, 19. September 2023 18:38 von Leander Jedamus */
/* modifiziert Samstag, 09. September 2023 08:42 von Leander Jedamus */
/* modifiziert Freitag, 08. September 2023 17:17 von Leander Jedamus */
/* modifiziert Donnerstag, 07. September 2023 16:30 von Leander Jedamus */
/* modifiziert Samstag, 02. September 2023 11:09 von Leander Jedamus */
/* modifiziert Mittwoch, 30. August 2023 19:05 von Leander Jedamus */
/* modifiziert Montag, 28. August 2023 08:29 von Leander Jedamus */
/* modifiziert Dienstag, 15. August 2023 15:46 von Leander Jedamus */
/* modifiziert Montag, 14. August 2023 08:53 von Leander Jedamus */
/* modifiziert Mittwoch, 26. Juli 2023 08:22 von Leander Jedamus */
/* modifiziert Dienstag, 18. Juli 2023 07:25 von Leander Jedamus */
/* modifiziert Montag, 17. Juli 2023 16:24 von Leander Jedamus */
/* modifiziert Montag, 10. Juli 2023 09:27 von Leander Jedamus */
/* modifiziert Freitag, 07. Juli 2023 12:59 von Leander Jedamus */

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#if defined __unix__
  #include <popt.h>
#endif

#include "types.h"
#include "project.h"
#include "version.h"
#include "macros.h"
#include "minmax.h"
#include "getlocaledir.h"
#include "gettext.h"
#include "clrscr.h"

#if defined __unix__ || defined __APPLE__
#include "getch.h"
#elif defined __WIN32__ || defined _MSC_VER || defined __MS_DOS__
  #include <conio.h>
#endif

#define MAX 0
#define MIN 1

#if defined __unix__
  #define POPTSTDOUTPUT stdout

void usage(poptContext optCon, int exitcode, char *error, char *addl) {
  poptPrintUsage(optCon, POPTSTDOUTPUT, 0);
  if (error) fprintf(POPTSTDOUTPUT, "%s: %s\n", error, addl);
  exit(exitcode);
}
#endif

int main(int argc, char *argv[]) {
  RUECKGABE   zahl, rmax, rmin;
  char        *localedir = getlocaledir(argv[0]);
  RUECKGABE   (*ptr[])(CONST ull zahlen, ...) = { max, min };
  int         zeichen;
#if defined __unix__
  poptContext optCon;   /* context for parsing command-line options */

  struct poptOption optionsTable[] = {
    POPT_AUTOHELP
    { NULL, 0, 0, NULL, 0 }
  };
#endif

#ifdef CLRSCR
  clrscr();
#endif

  setlocale(LC_ALL, "");
  bindtextdomain(PROJECT, localedir);
  textdomain(PROJECT);

  printf(_("%s V%s (C) %s by %s <%s>\n"), PROJECT, VERSION, YEARS, AUTHOR, EMAIL);

#if defined __unix__
  optCon = poptGetContext(NULL, argc, (const char **) argv, optionsTable, 0);
  if (argc < 2) {
    poptPrintUsage(optCon, POPTSTDOUTPUT, 0);
    exit(EXIT_FAILURE);
  }
#endif

#ifdef DEBUG
  printf("%s\n",localedir);
#endif

  printf("MIN=%" PRIRUECKGABE ":\n", RUECKGABE_MIN);
  printf("MAX=%" PRIRUECKGABE ":\n", RUECKGABE_MAX);

  printf(_("Enter a number: "));
  if(scanf("%" SCNRUECKGABE, &zahl) <= 0) {
    printf(_("Input error.\n"));
    zahl = 0;
  } /* if scanf */
  printf("%" PRIRUECKGABE "\n",zahl);
  
  rmax = (*ptr[MAX]) ((ull) zahl,7ULL,2ULL,3ULL,9ULL,8ULL,(ull) RUECKGABE_MIN);
  printf("\n");
  rmin = (*ptr[MIN]) ((ull) zahl,7ULL,2ULL,3ULL,9ULL,8ULL,(ull) RUECKGABE_MAX);

  printf("max=%" PRIRUECKGABE ",min=%" PRIRUECKGABE "\n",rmax,rmin);

  printf(_("Please press 'q' to end program!\n"));
  while ((zeichen=getch()) != 'q');

  free(localedir);

#if defined __unix__
  poptFreeContext(optCon);
#endif

  /* return EXIT_FAILURE; */
  return EXIT_SUCCESS;
}

/* vim:set cindent ai sw=2: */

