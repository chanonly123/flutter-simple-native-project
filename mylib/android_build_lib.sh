libname="mylib"
ndk_path="/Users/apple/NDK"

rm -rf build_android &&

cmake -B build_android \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SYSTEM_NAME=Android \
  -DCMAKE_SYSTEM_VERSION=21 \
  -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
  -DCMAKE_TOOLCHAIN_FILE="$ndk_path/build/cmake/android.toolchain.cmake" \
  -DCMAKE_ANDROID_STL_TYPE=gnustl_static &&

cd build_android &&

make &&

echo "✅✅✅✅✅✅✅✅✅✅✅ SUCCESS ✅✅✅✅✅✅✅✅✅✅✅"

# determine archs (brew install file)
echo "file =========="
file libmylib.so
echo "objdump=========="
objdump -h libmylib.so | grep 'file format'

