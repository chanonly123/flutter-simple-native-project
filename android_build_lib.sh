libname="mylib"
ndk_path="/Users/apple/NDK" # set here

cd mylib &&

rm -rf build_android &&

array=("arm64-v8a" "armeabi-v7a")
for element in "${array[@]}"
do
  echo "🔷 start $element"

  buildPath="build_android/$element"

  cmake -B "$buildPath" \
    -DCMAKE_SYSTEM_NAME=Android \
    -DANDROID_PLATFORM=21 \
    -DCMAKE_BUILD_TYPE=Release \
    -DANDROID_ABI="$element" \
    -DCMAKE_TOOLCHAIN_FILE="$ndk_path/build/cmake/android.toolchain.cmake" \
    -DCMAKE_ANDROID_STL_TYPE=gnustl_static &&

  make -C "$buildPath" &&

  # determine archs (brew install file)
  echo "objdump=========="
  objdump -h "$buildPath/libmylib.so" | grep 'file format'

  mkdir -p "../flutter_app/android/app/src/main/jniLibs/$element"
  mv "$buildPath/libmylib.so" "../flutter_app/android/app/src/main/jniLibs/$element/mylib.so"

  echo "🔷 end $element"

done

echo "✅✅✅✅✅✅✅✅✅✅✅ SUCCESS ✅✅✅✅✅✅✅✅✅✅✅"