CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cp ./student-submission/ListExamples.java grading-area
cp ./TestListExamples.java student-submission
cp ./student-submission/TestListExamples.java grading-area
javac -cp grading-area: grading-area/ListExamples.java grading-area/ListExamplesTests.java

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
set -e

if [[ -e $1 ]] && [[ -f $1 ]] && [[$file == *ListExamples* ]]; then
    echo "File is present."
    exit 1
fi

if [ ! -f "lab/student-submission/TestListExamples.java" ]; then
    echo "Error: TestListExamples.java is missing in your submission directory."
    echo "Please check your files and submit again."
    exit 1
fi

javac -cp "$CPATH" ./grading-area/student-submission/*.java
