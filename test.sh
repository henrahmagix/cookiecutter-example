# Setup

FAIL=0

test_is_directory() {
    test -d $1
    if [ $? -eq 1 ]; then
        FAIL=1
        echo "$1 is not a directory"
    fi
}

test_not_directory() {
    test -d $1
    if [ $? -eq 0 ]; then
        FAIL=1
        echo "$1 is a directory"
    fi
}

test_is_file() {
    test -f $1
    if [ $? -eq 1 ]; then
        FAIL=1
        echo "$1 is not a file"
    fi
}

test_not_file() {
    test -f $1
    if [ $? -eq 0 ]; then
        FAIL=1
        echo "$1 is a file"
    fi
}

test_files_equal() {
    cmp $1 $2
    if [ $? -eq 1 ]; then
        FAIL=1
        echo "$1 does not equal $2"
    fi
}

# Tests

cookiecutter --no-input .

test_is_directory   myfolder

test_is_file        myfolder/array-choice.txt
test_is_file        myfolder/object-choice.txt
test_is_file        myfolder/myfilename.myext
test_is_file        myfolder/cookiecutter.json

test_files_equal    myfolder/array-choice.txt   expected/array-choice.txt
test_files_equal    myfolder/object-choice.txt  expected/object-choice.txt
test_files_equal    myfolder/myfilename.myext   expected/myfilename.myext
test_files_equal    myfolder/cookiecutter.json  expected/cookiecutter.json

test_not_directory  myfolder/nextfolder
test_not_file       myfolder/nextfolder/nextfile.txt

cd myfolder && cookiecutter --no-input . && cd ..

test_is_directory   myfolder/nextfolder
test_is_file        myfolder/nextfolder/nextfile.txt
test_files_equal    myfolder/nextfolder/nextfile.txt    expected/nextfolder/nextfile.txt

# End

exit $FAIL
