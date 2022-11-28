set -e

rm -rf student-submission
mkdir student-submission
git clone $1 student-submission

cp TestListExamples.java student-submission
cd student-submission

CPATH=.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar

if [[ -f ListExamples.java ]];
then 
    echo "ListExamples.java file found!"
else
    echo "File Not Found! Make sure to submit the 'ListExamples.java file to be graded!"
    echo "Grade: Fail"
    exit 1
fi

set +e

javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo "Files have been compiled successfully!"
else
    echo "Error when compiling files!!"
    echo "Grade: Fail"
    exit 2
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > results.txt 

if [[ $? -eq 0 ]]
then
    echo "All Tests Passed!"
    echo "Grade: Pass"
    exit
else
    cat results.txt
    echo "are wrong!"
    echo "Grade: Fail"
    exit 3
fi