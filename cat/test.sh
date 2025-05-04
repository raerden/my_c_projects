F1="file1.txt"
F2="file2.txt"
F3="file_np.txt"

CAT_RES="cat_result.tst"
S21_RES="my_cat_result.tst"

CLEAR="rm -rf *.tst"
SLEEP="sleep 0.5"

echo ""
echo "  #Begin single options tests#"

$SLEEP
$CLEAR

cat -n $F1 > $CAT_RES
./my_cat -n $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -n SUCCESS" || echo "Test cat -n FAIL"

$SLEEP
$CLEAR

cat --number $F1 > $CAT_RES
./my_cat --number $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --number SUCCESS" || echo "Test cat --number FAIL"

$SLEEP
$CLEAR

cat -b $F1 > $CAT_RES
./my_cat -b $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -b SUCCESS" || echo "Test cat -b FAIL"

$SLEEP
$CLEAR

cat --number-nonblank $F1 > $CAT_RES
./my_cat --number-nonblank $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --number-nonblank SUCCESS" || echo "Test cat --number-nonblank FAIL"

$SLEEP
$CLEAR

cat -s $F1 > $CAT_RES
./my_cat -s $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -s SUCCESS" || echo "Test cat -s FAIL"

$SLEEP
$CLEAR

cat --squeeze-blank $F1 > $CAT_RES
./my_cat --squeeze-blank $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --squeeze-blank SUCCESS" || echo "Test cat --squeeze-blank FAIL"

$SLEEP
$CLEAR

cat -e $F1 > $CAT_RES
./my_cat -e $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -e SUCCESS" || echo "Test cat -e FAIL"

$SLEEP
$CLEAR

cat -E $F1 > $CAT_RES
./my_cat -E $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -E SUCCESS" || echo "Test cat -E FAIL"

$SLEEP
$CLEAR

cat --show-ends $F1 > $CAT_RES
./my_cat --show-ends $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --show-ends SUCCESS" || echo "Test cat --show-ends FAIL"

$SLEEP
$CLEAR

cat -t $F1 > $CAT_RES
./my_cat -t $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -t SUCCESS" || echo "Test cat -t FAIL"

$SLEEP
$CLEAR

cat -T $F1 > $CAT_RES
./my_cat -T $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -T SUCCESS" || echo "Test cat -T FAIL"

$SLEEP
$CLEAR

cat --show-tabs $F1 > $CAT_RES
./my_cat --show-tabs $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --show-tabs SUCCESS" || echo "Test cat --show-tabs FAIL"

$SLEEP
$CLEAR

cat -v $F1 > $CAT_RES
./my_cat -v $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -v SUCCESS" || echo "Test cat -v FAIL"

$SLEEP
$CLEAR

cat --show-nonprinting $F1 > $CAT_RES
./my_cat --show-nonprinting $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --show-nonprinting SUCCESS" || echo "Test cat --show-nonprinting FAIL"

$SLEEP
$CLEAR

cat -v $F1 $F2 $F3 > $CAT_RES
./my_cat -v $F1 $F2 $F3 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -v file1.txt file2.txt file_np.txt SUCCESS" || echo "Test cat -v file1.txt file2.txt file_np.txt FAIL"

echo ""
echo "  #Begin combined options tests#"

$SLEEP
$CLEAR

cat -ne $F1 > $CAT_RES
./my_cat -ne $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -ne SUCCESS" || echo "Test cat -ne FAIL"

$SLEEP
$CLEAR

cat --number --show-ends $F1 > $CAT_RES
./my_cat --number --show-ends $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat --number --show-ends SUCCESS" || echo "Test cat --number --show-ends FAIL"

$SLEEP
$CLEAR

cat -Esn $F1 > $CAT_RES
./my_cat -Esn $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -Esn SUCCESS" || echo "Test cat -Esn FAIL"


$SLEEP
$CLEAR

cat -beEnstTv $F1 > $CAT_RES
./my_cat -beEnstTv $F1 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -beEnstTv SUCCESS" || echo "Test cat -beEnstTv FAIL"

$SLEEP
$CLEAR

cat -EsT $F1 $F2 $F3 > $CAT_RES
./my_cat -EsT $F1 $F2 $F3 > $S21_RES
diff -q $CAT_RES $S21_RES && echo "Test cat -EsT file1.txt file2.txt file_np.txt SUCCESS" || echo "Test cat -EsT file1.txt file2.txt file_np.txt FAIL"

$CLEAR