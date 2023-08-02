#include "my_cat.h"

int main(int argc, char *argv[]) {
  int ret = 0;
  struct flags flags_readed = read_flags(argc, argv);
  if (!flags_readed.absent)
    print_files(flags_readed, argc, argv);
  else {
    printf("illegal option\n");
    ret = 1;
  }
  return ret;
}

struct flags read_flags(int argc, char *argv[]) {
  struct flags inp = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  int opt;
  static struct option long_options[] = {
      {"number-nonblank", no_argument, 0, 'b'},
      {"number", no_argument, 0, 'n'},
      {"squeeze-blank", no_argument, 0, 's'},
      {0, 0, 0, 0}};
  while ((opt = getopt_long(argc, argv, "+vbenstET", long_options, NULL)) !=
         -1) {
    switch (opt) {
      case 'b':
        inp.bflag++;
        break;
      case 'e':
        inp.eflag++;
        break;
      case 'n':
        inp.nflag++;
        break;
      case 's':
        inp.sflag++;
        break;
      case 't':
        inp.tflag++;
        break;
      case 'v':
        inp.vflag++;
        break;
      case 'T':
        inp.Tflag++;
        break;
      case 'E':
        inp.Eflag++;
        break;
      case '?':
        inp.absent++;
        break;
    }
  }
  inp.queue = optind;
  return inp;
}

void print_files(struct flags flags_readed, int argc, char *argv[]) {
  FILE *file;
  char sym;
  char prev_sym;
  int blank_str = 0;

  while (flags_readed.queue < argc) {
    prev_sym = '\n';
    file = fopen(argv[flags_readed.queue], "rb");
    if (file != NULL) {
      int line_num = 0;
      while ((sym = fgetc(file)) != EOF) {
        if (flags_readed.bflag != 0) b_func(&sym, &prev_sym, &line_num);
        if (flags_readed.nflag != 0 && flags_readed.bflag == 0)
          n_func(&prev_sym, &line_num, &blank_str);
        if (flags_readed.sflag != 0 &&
            s_func(&sym, &prev_sym, &blank_str, &flags_readed.eflag))
          continue;
        if (flags_readed.eflag != 0 || flags_readed.Eflag != 0) e_func(&sym);

        if (flags_readed.tflag != 0 || flags_readed.Tflag != 0)
          t_func(&sym, &flags_readed.Tflag, &flags_readed.vflag);
        else if (flags_readed.eflag != 0 || flags_readed.vflag != 0)
          print_hidden(&sym);
        else
          printf("%c", sym);
        prev_sym = sym;
      }
      fclose(file);
    } else
      printf("No such file or directory\n");
    flags_readed.queue++;
  }
}

void b_func(char *sym, char *prev_sym, int *line_num) {
  if (*line_num == 0 && *sym != '\n')
    printf("%6d\t", *line_num += 1);
  else if (*prev_sym == '\n' && *sym != '\n')
    printf("%6d\t", *line_num += 1);
}

void n_func(char *prev_sym, int *line_num, int *blank_str) {
  if (*line_num == 0)
    printf("%6d\t", *line_num += 1);
  else if (*prev_sym == '\n' && *blank_str < 2)
    printf("%6d\t", *line_num += 1);
}

int s_func(char *sym, char *prev_sym, int *blank_str, int *eflag) {
  if (*prev_sym == '\n' && *sym == '\n')
    *blank_str += 1;
  else
    *blank_str = 0;
  if (*blank_str == 1 && *eflag == 1)
    printf("$\n");
  else if (*blank_str == 1)
    printf("\n");
  return *blank_str;
}

void t_func(char *sym, int *Tflag, int *vflag) {
  if (*sym == '\t')
    printf("^I");
  else if (*Tflag == 1 && *vflag == 0)
    printf("%c", *sym);
  else
    print_hidden(sym);
}

void e_func(char *sym) {
  if (*sym == '\n') printf("$");
}

void print_hidden(char *sym) {
  if ((*sym < 127 && *sym > 31) || *sym == 10 || *sym == 9)
    printf("%c", *sym);
  else if (*sym < 32)
    printf("^%c", *sym + 64);
  else if (*sym == 127)
    printf("^?");
}