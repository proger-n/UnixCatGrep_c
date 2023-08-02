#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 9000

struct flags {
  int ignore_case;
  int invert_match;
  int count_matches;
  int print_filenames;
  int print_line_numbers;
  int dont_show_filename;
  int dont_show_err;
  int only_match;
  int use_extended_regex;
  char *pattern;
  int invalid_option;
  int has_flags;
  int pattern_from_file;
};

struct flags read_flags(int argc, char *argv[]);
void flags_switch(char argv, struct flags *inp);
int print_result(struct flags flags_readed, int argc, char *argv[]);
int read_line(int regex_rslt, char line[MAX_LINE_LENGTH], int argc, char *argv,
              struct flags inp, int line_number, int num_matches);
char *f_func(char *filename, char *buffer);