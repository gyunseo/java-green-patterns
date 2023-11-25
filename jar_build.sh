chmod u+x ./**/**/*.sh
echo "delete all jar file"
rm -rf ./**/**/*.jar

echo "Start build jar files"

echo "start build jar file for lazy-initialize"
cd lazy-initialize/Before/
./before.sh
echo "rename jar file to before green pattern #1"
mv Before.jar before_1.jar
cd ../After/
./after.sh
echo "rename jar file to after green pattern #1"
mv After.jar after_1.jar

echo "start build jar file for efficient-data-structure"
cd ../../efficient-data-structure/Before/
echo "rename jar file to before green pattern #2"
mv Before.jar before_2.jar
./before.sh
cd ../After/
./after.sh
echo "rename jar file to after green pattern #2"
mv After.jar after_2.jar

echo "start build jar file for object-pool"
cd ../../object-pool/Before/
./before.sh
echo "rename jar file to before green pattern #3"
mv Before.jar before_3.jar
cd ../After/
./after.sh
echo "rename jar file to after green pattern #3"
mv After.jar after_3.jar