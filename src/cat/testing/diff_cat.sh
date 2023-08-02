echo -------------------START_OF_TEST---------------------------
echo 1----------------------------------------------
echo *CAT without flags, 1 file:
echo "diff <(cat test_files/ascii.txt) <(./../my_cat.out test_files/ascii.txt)"
diff <(cat test_files/ascii.txt) <(./../my_cat.out test_files/ascii.txt) -s
echo 2----------------------------------------------
echo *CAT without flags, 2 files:
echo "diff <(cat test_files/ascii.txt test_files/test.txt) <(./../my_cat.out test_files/ascii.txt test_files/test.txt)"
diff <(cat test_files/ascii.txt test_files/test.txt) <(./../my_cat.out test_files/ascii.txt test_files/test.txt) -s
echo 3----------------------------------------------
echo *CAT -b, 1 file:
echo "diff <(cat -b test_files/ascii.txt) <(./../my_cat.out -b test_files/ascii.txt)"
diff <(cat -b test_files/ascii.txt) <(./../my_cat.out -b test_files/ascii.txt) -s
echo 4----------------------------------------------
echo *CAT -b, 2 files:
echo "diff <(cat -b test_files/ascii.txt test_files/test.txt) <(./../my_cat.out -b test_files/ascii.txt test_files/test.txt)"
diff <(cat -b test_files/ascii.txt test_files/test.txt) <(./../my_cat.out -b test_files/ascii.txt test_files/test.txt) -s
echo 5----------------------------------------------
echo *CAT -e, 1 file:
echo "diff <(cat -e test_files/ascii.txt) <(./../my_cat.out -e test_files/ascii.txt)"
diff <(cat -e test_files/ascii.txt) <(./../my_cat.out -e test_files/ascii.txt) -s
echo 6----------------------------------------------
echo *CAT -e, 2 files:
echo "diff <(cat -e test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -e test_files/ascii.txt test_files/patterns.txt)"
diff <(cat -e test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -e test_files/ascii.txt test_files/patterns.txt) -s
echo 7----------------------------------------------
echo *CAT -n, 1 file:
echo "diff <(cat -n test_files/ascii.txt) <(./../my_cat.out -n test_files/ascii.txt)"
diff <(cat -n test_files/ascii.txt) <(./../my_cat.out -n test_files/ascii.txt) -s
echo 8----------------------------------------------
echo *CAT -n, 2 files:
echo "diff <(cat -n test_files/ascii.txt test_files/test.txt) <(./../my_cat.out -n test_files/ascii.txt test_files/test.txt)"
diff <(cat -n test_files/ascii.txt test_files/test.txt) <(./../my_cat.out -n test_files/ascii.txt test_files/test.txt) -s
echo 9----------------------------------------------
echo *CAT -s, 1 file:
echo "diff <(cat -s test_files/ascii.txt) <(./../my_cat.out -s test_files/ascii.txt)"
diff <(cat -s test_files/ascii.txt) <(./../my_cat.out -s test_files/ascii.txt) -s
echo 10----------------------------------------------
echo *CAT -s, 2 files:
echo "diff <(cat -s test_files/ascii.txt test_files/test.txt) <(./../my_cat.out -s test_files/ascii.txt test_files/test.txt)"
diff <(cat -s test_files/ascii.txt test_files/test.txt) <(./../my_cat.out -s test_files/ascii.txt test_files/test.txt) -s
echo 11----------------------------------------------
echo *CAT -t, 1 file:
echo "diff <(cat -t test_files/ascii.txt) <(./../my_cat.out -t test_files/ascii.txt)"
diff <(cat -t test_files/ascii.txt) <(./../my_cat.out -t test_files/ascii.txt) -s
echo 12----------------------------------------------
echo *CAT -t, 2 files:
echo "diff <(cat -t test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -t test_files/ascii.txt test_files/patterns.txt)"
diff <(cat -t test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -t test_files/ascii.txt test_files/patterns.txt) -s
echo 13----------------------------------------------
echo *CAT --number-nonblank, 1 file:
echo "diff <(cat -b test_files/ascii.txt) <(./../my_cat.out --number-nonblank test_files/ascii.txt)"
diff <(cat -b test_files/ascii.txt) <(./../my_cat.out --number-nonblank test_files/ascii.txt) -s
echo 14----------------------------------------------
echo *CAT --number-nonblank, 2 files:
echo "diff <(cat -b test_files/ascii.txt test_files/test.txt) <(./../my_cat.out --number-nonblank test_files/ascii.txt test_files/test.txt)"
diff <(cat -b test_files/ascii.txt test_files/test.txt) <(./../my_cat.out --number-nonblank test_files/ascii.txt test_files/test.txt) -s
echo 15----------------------------------------------
echo *CAT --number, 1 file:
echo "diff <(cat -n test_files/ascii.txt) <(./../my_cat.out --number test_files/ascii.txt)"
diff <(cat -n test_files/ascii.txt) <(./../my_cat.out --number test_files/ascii.txt) -s
echo 16----------------------------------------------
echo *CAT --number, 2 files:
echo "diff <(cat -n test_files/ascii.txt test_files/test.txt) <(./../my_cat.out --number test_files/ascii.txt test_files/test.txt)"
diff <(cat -n test_files/ascii.txt test_files/test.txt) <(./../my_cat.out --number test_files/ascii.txt test_files/test.txt) -s
echo 17----------------------------------------------
echo *CAT --squeeze-blank, 1 file:
echo "diff <(cat -s test_files/ascii.txt) <(./../my_cat.out --squeeze-blank test_files/ascii.txt)"
diff <(cat -s test_files/ascii.txt) <(./../my_cat.out --squeeze-blank test_files/ascii.txt) -s
echo 18----------------------------------------------
echo *CAT --squeeze-blank, 2 files:
echo "diff <(cat -s test_files/ascii.txt test_files/test.txt) <(./../my_cat.out --squeeze-blank test_files/ascii.txt test_files/test.txt)"
diff <(cat -s test_files/ascii.txt test_files/test.txt) <(./../my_cat.out --squeeze-blank test_files/ascii.txt test_files/test.txt) -s
echo 19----------------------------------------------
echo *CAT -Tv, 1 file:
echo "diff <(cat -t test_files/ascii.txt) <(./../my_cat.out -Tv test_files/ascii.txt)"
diff <(cat -t test_files/ascii.txt) <(./../my_cat.out -Tv test_files/ascii.txt) -s
echo 20----------------------------------------------
echo *CAT -Tv, 2 files:
echo "diff <(cat -t test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -Tv test_files/ascii.txt test_files/patterns.txt)"
diff <(cat -t test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -Tv test_files/ascii.txt test_files/patterns.txt) -s
echo 21----------------------------------------------
echo *CAT -Ev, 1 file:
echo "diff <(cat -e test_files/ascii.txt) <(./../my_cat.out -Ev test_files/ascii.txt)"
diff <(cat -e test_files/ascii.txt) <(./../my_cat.out -Ev test_files/ascii.txt) -s
echo 22----------------------------------------------
echo *CAT -Ev, 2 files:
echo "diff <(cat -e test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -Ev test_files/ascii.txt test_files/patterns.txt)"
diff <(cat -e test_files/ascii.txt test_files/patterns.txt) <(./../my_cat.out -Ev test_files/ascii.txt test_files/patterns.txt) -s
echo 21----------------------------------------------
echo *CAT Bad flag:
echo "diff <(cat -y test_files/ascii.txt) <(./../my_cat.out -y test_files/ascii.txt)"
diff <(cat -y test_files/ascii.txt) <(./../my_cat.out -y test_files/ascii.txt) -s
echo 22----------------------------------------------
echo *CAT Bad files:
echo "diff <(cat -e nofile test_files/patterns.txt) <(./../my_cat.out -e nofile test_files/patterns.txt)"
diff <(cat -e nofile test_files/patterns.txt) <(./../my_cat.out -e nofile test_files/patterns.txt) -s
echo -------------------END_OF_TEST---------------------------