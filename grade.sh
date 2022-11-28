set -e 

rm -rf student-submission > rmout.txt 2>rmerr.txt
mkdir student-submission > mkout.txt 2>mkerr.txt
git clone $1 student-submission > gitout.txt 2>giterr.txt

cp TestListExamples.java student-submission > cpout.txt 2>cperr.txt
echo $? > cpexit.txt
cd student-submission > cdout.txt 2>cderr.txt
echo $? > cdexit.txt 

CPATH=.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar

if [[ -f ListExamples.java ]];
then 
    echo "ListExamples.java file found!"
else
    echo "File Not Found! Make sure to submit the ListExamples.java file to be graded!" > ech1out.txt 2>ech1err.txt
    echo $? > ech1exit.txt 
    echo "Grade: Fail" > ech2out.txt 2>ech2err.txt
    echo $? > ech2exit.txt 
    exit 1 > exitout.txt 2>exiterr.txt
fi

set +e > set1out.txt 2>set1err.txt
echo $? > set1exit.txt 

javac -cp $CPATH *.java > javacout.txt 2>javacerr.txt
echo $? > javacexit.txt 

if [[ $? -eq 0 ]]
then
    echo "Files have been compiled successfully!"
else
    echo "Error when compiling files!!"
    echo "Grade: Fail"
    exit 2
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > javaout.txt 2>javaerr.txt
echo $? > javaexit.txt 

if [[ $? -eq 0 ]]
then
    echo "All Tests Passed!"
    echo "Grade: Pass"
    exit
else
    cat results.txt
    echo "Tests failed!"
    echo "Grade: Fail"
    exit 3
fi