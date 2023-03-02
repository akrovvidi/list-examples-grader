CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
set +e
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -f ListExamples.java ]]
then
    echo "ListExamples.java found"
else
    ListExamplesecho "need file ListExamples.java"
    exit 1
fi 
cp ../TestListExamples.java ./
cp -r ../lib ./
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2>javac-errs.txt
if [[ $? -ne 0 ]]
then 
    echo "Compile Error"
    exit 1
fi
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples >testResults.txt
cat testResults.txt