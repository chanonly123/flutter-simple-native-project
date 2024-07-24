libname="mylib"
ndk_path="/Users/apple/NDK" # set here

cd mylib &&

rm -rf build_android &&

cmake -B build_android \
  -DANDROID_PLATFORM=21 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
  -DCMAKE_SYSTEM_NAME=Android \
  -DCMAKE_TOOLCHAIN_FILE="/Users/apple/NDK/build/cmake/android.toolchain.cmake" \
  -DCMAKE_ANDROID_STL_TYPE=gnustl_static &&

cd build_android &&

make &&

echo "✅✅✅✅✅✅✅✅✅✅✅ SUCCESS ✅✅✅✅✅✅✅✅✅✅✅"

# determine archs (brew install file)
echo "objdump=========="
objdump -h libmylib.so | grep 'file format'


# libJuceLib.so: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), 
# dynamically linked, BuildID[sha1]=ad8ce983dcedcb66517fb8fa605893b8ac71829a, stripped