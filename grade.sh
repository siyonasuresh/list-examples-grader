set -e
 
rm -rf student-submission
git clone $1 student-submission
cd student-submission
 
FILE=./ListExamples.java
if test -f "$FILE" ;
then
    echo "$FILE exists."
else
    echo "$FILE does not exists or is not a regular file."
fi
 
mkdir -p ./testdir
cp ./ListExamples.java ./testdir
cp ../TestListExamples.java ./testdir
 
cd ./testdir
set +e
javac -cp ".;../../lib/hamcrest-core-1.3.jar;../../lib/junit-4.13.2.jar" *.java
if [ $? -eq 0 ]
then
    echo "Compiled Successfully. :)"
else
    echo "Did not Compile Successfully. :("
fi
 
java TestListExamples
if [ $? -eq 0 ]
then
    echo "Java Ran Successfully. :)"
else
    echo "Java did not run Successfully. :("
fi
 
 
