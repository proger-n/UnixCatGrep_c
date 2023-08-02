
# ---------
my_grep=./../my_grep.out;
filename1=diff_grep.sh;
filename2=test_files/test.txt;
filename3=test_files/patterns.txt; #  -f for patterns
pattern=some;
# ---------
decor=---------------------------------------------
echo "$decor" *GREP 1 Just a pattern with two files
echo  {grep "$pattern" "$filename2" "$filename1"}  {"$my_grep" "$pattern" "$filename2" "$filename1"}
diff <(grep "$pattern" "$filename2" "$filename1") <("$my_grep" "$pattern" "$filename2" "$filename1")
# -------------------------------------------------
echo "$decor" *GREP 1 -e with two files
echo  {grep -e "$pattern" "$filename2" "$filename1"}  {"$my_grep" -e "$pattern" "$filename2" "$filename1"}
diff <(grep -e "$pattern" "$filename2" "$filename1") <("$my_grep" -e "$pattern" "$filename2" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 2 -i

echo  {grep -i "$pattern" "$filename1"}  {"$my_grep" -i "$pattern" "$filename1"}
diff <(grep -i "$pattern" "$filename1") <("$my_grep" -i "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 3 -v
echo  {grep -v "$pattern" "$filename1"}  {"$my_grep" -v "$pattern" "$filename1"}
diff <(grep -v "$pattern" "$filename1") <("$my_grep" -v "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 4 -c
echo  {grep -c "$pattern" "$filename1"}  {"$my_grep" -c "$pattern" "$filename1"}
diff <(grep -c "$pattern" "$filename1") <("$my_grep" -c "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 5 -l with three files
echo  {grep -l "$pattern" "$filename2" "$filename3" "$filename1"}  {"$my_grep" -l "$pattern" "$filename2" "$filename3" "$filename1"}
diff <(grep -l "$pattern" "$filename2" "$filename3" "$filename1") <("$my_grep" -l "$pattern" "$filename2" "$filename3" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 6 -n
echo  {grep -n "$pattern" "$filename1"}  {"$my_grep" -n "$pattern" "$filename1"} 
diff <(grep -n "$pattern" "$filename1") <("$my_grep" -n "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 7 BONUS -h
echo  {grep -h "$pattern" "$filename1"}  {"$my_grep" -h "$pattern" "$filename1"}

diff <(grep -h "$pattern" "$filename1") <("$my_grep" -h "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 8 BONUS -o
echo  {grep -o "$pattern" "$filename1"}  {"$my_grep" -o "$pattern" "$filename1"}
diff <(grep -o "$pattern" "$filename1") <("$my_grep" -o "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 9 BONUS -h with two files
echo  {grep -h "$pattern" "$filename2" "$filename1"}  {"$my_grep" -h "$pattern" "$filename2" "$filename1"}
diff <(grep -h "$pattern" "$filename2" "$filename1") <("$my_grep" -h "$pattern" "$filename2" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 10 BONUS -s
echo  {grep -s "$pattern" aboba}  {"$my_grep" -s "$pattern" aboba}
diff <(grep -s "$pattern" aboba) <("$my_grep" -s "$pattern" aboba) -s $q
# -------------------------------------------------
echo "$decor" *GREP 11 BONUS -f
echo  {grep -f "$filename3" "$filename2"}  {"$my_grep" -f "$filename3" "$filename2"}
diff <(grep -f "$filename3" "$filename2") <("$my_grep" -f "$filename3" "$filename2") -s $q
# -------------------------------------------------
echo "$decor" *GREP 12 BONUS -in
echo  {grep -in "$pattern" "$filename1"}  {"$my_grep" -in "$pattern" "$filename1"}
diff <(grep -in "$pattern" "$filename1") <("$my_grep" -in "$pattern" "$filename1") -s $q
# -------------------------------------------------
echo "$decor" *GREP 13 BONUS -cv
echo  {grep -cv "$pattern" "$filename1"}  {"$my_grep" -cv "$pattern" "$filename1"}
diff <(grep -cv "$pattern" "$filename1") <("$my_grep" -cv "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 14 BONUS -iv
echo  {grep -iv "$pattern" "$filename1"}  {"$my_grep" -iv "$pattern" "$filename1"}
diff <(grep -iv "$pattern" "$filename1") <("$my_grep" -iv "$pattern" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 15 BONUS -lv with three files
echo  {grep -lv "$pattern" "$filename2" "$filename3" "$filename1"}  {"$my_grep" -lv "$pattern" "$filename2" "$filename3" "$filename1"}
diff <(grep -lv "$pattern" "$filename2" "$filename3" "$filename1") <("$my_grep" -lv "$pattern" "$filename2" "$filename3" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 16 BONUS -ho with two files
echo  {grep -ho "$pattern" "$filename2" "$filename1"}  {"$my_grep" -ho "$pattern" "$filename2" "$filename1"}
diff <(grep -ho "$pattern" "$filename2" "$filename1") <("$my_grep" -ho "$pattern" "$filename2" "$filename1") -s
# -------------------------------------------------
echo "$decor" *GREP 17 BONUS -nf
echo  {grep -nf "$filename3" "$filename2"}  {"$my_grep" -nf "$filename3" "$filename2"}
diff <(grep -nf "$filename3" "$filename2") <("$my_grep" -nf "$filename3" "$filename2") -s
# -------------------------------------------------
echo "$decor" *Tests ended*
