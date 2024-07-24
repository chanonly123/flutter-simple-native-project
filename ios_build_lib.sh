libname="mylib"

cd mylib &&

rm -rf build_ios &&

cmake -G Xcode -B build_ios \
    -DCMAKE_SYSTEM_NAME=iOS \
    -DCMAKE_Swift_COMPILER_FORCED=true \
    -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0 &&

cd build_ios &&

xcodebuild -target "${libname}" -configuration Release -sdk iphoneos only_active_arch=no clean build &&
xcodebuild -target "${libname}" -configuration Release -sdk iphonesimulator only_active_arch=no clean build &&

# rename
mv "Release-iphoneos/lib${libname}.a" "Release-iphoneos/${libname}.a" &&
mv "Release-iphonesimulator/lib${libname}.a" "Release-iphonesimulator/${libname}.a" &&

# create universal iOS framework
xcodebuild -create-xcframework \
    -library "Release-iphoneos/${libname}.a" -headers ../includes \
    -library "Release-iphonesimulator/${libname}.a" -headers ../includes \
    -output "${libname}.xcframework" &&

echo "✅✅✅✅✅✅✅✅✅✅✅ SUCCESS ✅✅✅✅✅✅✅✅✅✅✅"

# check archs
lipo -info "Release-iphoneos/${libname}.a"
lipo -info "Release-iphonesimulator/${libname}.a"