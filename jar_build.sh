chmod u+x ./**/**/*.sh
echo "delete all jar file"
rm -rf ./**/**/*.jar
echo "delete all zip file"
rm -rf *.zip

echo "Start build jar files"

echo "start build jar file for lazy-initialize"
cd ./lazy-initialize/Before/
./before.sh
echo "rename jar file to before green pattern #19"
mv Before.jar before_19.jar
cd ../After/
./after.sh
echo "rename jar file to after green pattern #19"
mv After.jar after_19.jar


echo "start build jar file for efficient-data-structure"
cd ../../efficient-data-structure/Before/
./before.sh
echo "rename jar file to before green pattern #2"
mv Before.jar before_2.jar
cd ../After/
./after.sh
echo "rename jar file to after green pattern #2"
mv After.jar after_2.jar

echo "start build jar file for object-pool"
cd ../../object-pool/Before/
./before.sh
echo "rename jar file to before green pattern #17"
mv Before.jar before_17.jar
cd ../After/
./after.sh
echo "rename jar file to after green pattern #17"
mv After.jar after_17.jar

echo "test all jar files work well"
cd ../../
/usr/bin/time -v echo "test before green pattern #19"
time java -jar ./lazy-initialize/Before/before_19.jar
echo "test after green pattern #19"
/usr/bin/time -v java -jar ./lazy-initialize/After/after_19.jar
echo "test before green pattern #2"
/usr/bin/time -v java -jar ./efficient-data-structure/Before/before_2.jar
echo "test after green pattern #2"
/usr/bin/time -v java -jar ./efficient-data-structure/After/after_2.jar
echo "test before green pattern #17"
/usr/bin/time -v java -jar ./object-pool/Before/before_17.jar
echo "test after green pattern #17"
/usr/bin/time -v java -jar ./object-pool/After/after_17.jar


echo "zip all jar files"
# 최종적으로 생성할 zip 파일
zipfile="jar_files.zip"

# .jar 파일을 찾아서 압축
find . -name '*.jar' | while read file; do
    dir=$(dirname "$file")
    filename=$(basename "$file")
    (cd "$dir" && zip -r "$OLDPWD/$zipfile" "$filename")
done

