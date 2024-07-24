#ifndef mylib_h
#ifdef __cplusplus
#define EXPORT_C_FUNC extern "C" __attribute__((visibility("default"))) __attribute__((used))

EXPORT_C_FUNC int nativeAdd(int a, int b);
EXPORT_C_FUNC void load();

#endif
#endif