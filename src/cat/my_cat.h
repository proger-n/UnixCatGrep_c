#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

struct flags {
  int bflag;
  int eflag;
  int nflag;
  int sflag;
  int tflag;
  int Tflag;
  int Eflag;
  int queue;
  int vflag;
  int absent;
};

struct flags read_flags(int argc, char *argv[]);
void print_files(struct flags flags_readed, int argc, char *argv[]);
void b_func(char *sym, char *prev_sym, int *line_num);
void n_func(char *prev_sym, int *line_num, int *blank_str);
int s_func(char *sym, char *prev_sym, int *blank_str, int *eflag);
void t_func(char *sym, int *Tflag, int *vflag);
void e_func(char *sym);
void print_hidden(char *sym);