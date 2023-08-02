#include "my_grep.h"

int main(int argc, char *argv[]) {
  int ret;

  struct flags flags_readed = read_flags(argc, argv);
  if (!flags_readed.invalid_option)
    ret = print_result(flags_readed, argc, argv);
  else
    ret = 1;

  return ret;
}

struct flags read_flags(int argc, char *argv[]) {
  struct flags inp = {0, 0, 0, 0, 0, 0, 0, 0, 0, "", 0, 0, 0};
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-') {
      for (int j = 1; argv[i][j] != '\0'; j++) {
        flags_switch(argv[i][j], &inp);
      }
    } else {
      if (argv[i - 1][0] == '-' && inp.has_flags < 2 && !inp.pattern_from_file)
        inp.pattern = argv[i];
      else if (argv[i - 1][0] == '-' && !inp.pattern_from_file) {
        strcat(inp.pattern, "|");
        strcat(inp.pattern, argv[i]);
      }
    }
  }
  if (inp.has_flags == 0 && argc > 2) inp.pattern = argv[1];
  return inp;
}

int print_result(struct flags inp, int argc, char *argv[]) {
  regex_t regex;
  int regex_rslt, ret = 0, num_matches = 0, line_number;
  FILE *fp;
  char buffer[10000];
  char line[MAX_LINE_LENGTH];
  if (inp.pattern_from_file) inp.pattern = f_func(argv[2], buffer);
  if (regcomp(&regex, inp.pattern,
              inp.ignore_case ? REG_ICASE : REG_EXTENDED) == 0) {
    for (int i = inp.has_flags + 2; i < argc; i++) {
      fp = fopen(argv[i], "r");
      if (fp == NULL) {
        if (!inp.dont_show_err) printf("Error opening file %s\n", argv[i]);
        continue;
      } else {
        line_number = 0;
        while (fgets(line, MAX_LINE_LENGTH, fp) != NULL) {
          line_number++;
          regex_rslt = regexec(&regex, line, 0, NULL, 0);
          num_matches = read_line(regex_rslt, line, argc, argv[i], inp,
                                  line_number, num_matches);
        }
        if (inp.count_matches) {
          if (argc > inp.has_flags + 3) printf("%s:", argv[i]);
          printf("%d\n", num_matches);
        }
        num_matches = 0;
        fclose(fp);
      }
    }
    regfree(&regex);
  } else {
    printf("Error compiling regular expression\n");
    ret = 1;
  }
  return ret;
}

int read_line(int regex_rslt, char line[MAX_LINE_LENGTH], int argc, char *argv,
              struct flags inp, int line_number, int num_matches) {
  char *match;
  if (inp.invert_match == (regex_rslt != 0)) {
    if (inp.count_matches)
      num_matches++;
    else if (inp.print_filenames) {
      num_matches++;
      if (num_matches == 1) {
        printf("%s\n", argv);
      }
    } else {
      if (inp.dont_show_filename || argc <= inp.has_flags + 3) {
        if (inp.print_line_numbers) printf("%d:", line_number);
        if (!inp.only_match)
          printf("%s", line);
        else {
          match = strstr(line, inp.pattern);
          while (match != NULL) {
            printf("%s\n", inp.pattern);
            match = strstr(match + 1, inp.pattern);
          }
        }
      } else {
        printf("%s:", argv);
        if (inp.print_line_numbers) printf("%d:", line_number);
        if (!inp.only_match)
          printf("%s", line);
        else
          printf("%s\n", inp.pattern);
      }
    }
  }
  return num_matches;
}

char *f_func(char *filename, char *buffer) {
  FILE *file = fopen(filename, "r");
  if (file == NULL) {
    printf("Error: could not open file\n");
    return NULL;
  }

  char line[1000];

  buffer[0] = '\0';

  while (fgets(line, sizeof(line), file)) {
    line[strcspn(line, "\n")] = '\0';

    strcat(buffer, line);
    strcat(buffer, "|");
  }

  fclose(file);
  buffer[strlen(buffer) - 1] = '\0';
  return buffer;
}

void flags_switch(char argv, struct flags *inp) {
  switch (argv) {
    case 'i':
      inp->ignore_case = inp->has_flags = 1;
      break;
    case 'v':
      inp->invert_match = inp->has_flags = 1;
      break;
    case 'c':
      inp->count_matches = inp->has_flags = 1;
      break;
    case 'l':
      inp->print_filenames = inp->has_flags = 1;
      break;
    case 'n':
      inp->print_line_numbers = inp->has_flags = 1;
      break;
    case 'h':
      inp->dont_show_filename = inp->has_flags = 1;
      break;
    case 's':
      inp->dont_show_err = inp->has_flags = 1;
      break;
    case 'o':
      inp->only_match = inp->has_flags = 1;
      break;
    case 'e':
      inp->use_extended_regex += 1;
      if (inp->use_extended_regex == 1)
        inp->has_flags += 1;
      else
        inp->has_flags += 2;
      break;
    case 'f':
      inp->pattern_from_file = inp->has_flags = 1;
      break;
    default:
      inp->invalid_option = 1;
  }
}