cd mylib &&
cmake -B build &&
cd build &&
make &&

cd ..
cd ..

cmake -B build &&
cd build &&
make &&

echo "✅✅✅✅ Build success ✅✅✅✅"

echo "🔷 Running"

./CMD_TEST

echo "🔷 Complete"