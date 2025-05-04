#include "my_cat.h"


int main(int argc, char *argv[]) {
  OPT options;
  init_options(&options);

  if (argc > 1) {
    read_options(&options, argc, argv);
  }

  for (int i = optind; i < argc; i++) {
    print_file(options, argv[i]);
  }

  if (argc == 1) {
    printf("Command line has no additional arguments\n");
  }

  return 0;
}

void init_options(OPT *options) {
  options->b = 0;
  options->e = 0;
  options->E = 0;
  options->n = 0;
  options->s = 0;
  options->t = 0;
  options->T = 0;
  options->v = 0;
}

void read_options(OPT *options, int argc, char *argv[]) {
  int option;
  int option_index = -1;

  while ((option = getopt_long(argc, argv, short_options, long_options,
                               &option_index)) != -1) {
    switch (option) {
      case 'b':
        options->b = 1;
        options->n = 0;
        break;
      case 'e':
        options->e = 1;
        break;
      case 'E':
        options->E = 1;
        break;
      case 'n':
        options->n = options->b ? 0 : 1;  //взаимоисключающие флаги
        break;
      case 's':
        options->s = 1;
        break;
      case 't':
        options->t = 1;
        break;
      case 'T':
        options->T = 1;
        break;
      case 'v':
        options->v = 1;
        break;
      case '?':
        printf("usage: cat [-benstuv] [file ...]\n");
    }
  }
}


void print_file(OPT options, const char *filename) {
  FILE *file = fopen(filename, "r");
  if (file != NULL) {
    unsigned int LinesCount = 0;
    char ch;
    char lastch = '\n';
    int squeeze = 0;

    while ((ch = fgetc(file)) != EOF) {
      if (options.s && ch == '\n' && lastch == '\n') {
        if (squeeze) continue;
        squeeze = 1;
      } else
        squeeze = 0;

      if (lastch == '\n') {
        if (options.b && ch != '\n')
          printf("%6d\t", ++LinesCount);
        else if (options.n)
          printf("%6d\t", ++LinesCount);
      }

      lastch = ch;
      print_ch(options, ch);

    }  // END while ((ch = fgetc(file)) != EOF)
    fclose(file);
  }
}

void print_ch(OPT options, unsigned char ch) {
  int print_char = 1;
  
  if (ch == '\n' && (options.e || options.E)) printf("$");

  if (ch == '\t' && (options.t || options.T)) {
    printf("^I");
    print_char = 0;
  }

  if (options.v) {
    if (ch < 32 && ch != '\t' && ch != '\n') {
      printf("^%c", ch + 64);
    } else if (ch > 127 && ch < 160) {
      printf("M-^%c", ch - 64);
    } else if (ch >= 160) {
      printf("M-%c", ch - 128);
    } else if (ch == 127) {
      printf("^?");
    } else if (print_char) {
      putchar(ch);
    }

  } else if (print_char)
    putchar(ch);
}