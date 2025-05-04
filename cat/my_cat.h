#include <getopt.h>
#include <stdio.h>

const char *short_options = "beEnstTv";

const struct option long_options[] = {
    {"number-nonblank", no_argument, NULL, 'b'},
    {"show-ends", no_argument, NULL, 'E'},
    {"number", no_argument, NULL, 'n'},
    {"squeeze-blank", no_argument, NULL, 's'},
    {"show-tabs", no_argument, NULL, 'T'},
    {"show-nonprinting", no_argument, NULL, 'v'},
    {NULL, 0, NULL, 0}};

typedef struct {
  int b;
  int e;
  int E;
  int n;
  int s;
  int t;
  int T;
  int v;
} OPT;

void init_options(OPT *options);
void read_options(OPT *options, int argc, char *argv[]);
void print_file(OPT options, const char *filename);
void print_ch(OPT options, unsigned char ch);