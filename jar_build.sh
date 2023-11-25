chmod u+x ./**/**/*.sh

echo "Start build jar file"

echo "start build jar file for lazy-initialize"
cd lazy-initialize/Before/
./before.sh
cd ../After/
./after.sh

echo "start build jar file for efficient-data-structure"
cd ../../efficient-data-structure/Before/
./before.sh
cd ../After/
./after.sh

echo "start build jar file for object-pool"
cd ../../object-pool/Before/
./before.sh
cd ../After/
./after.sh
