
// Patch for the bug 
// - missing wxCRT_StrdupW() in the wxWidgets-3.0.3 gccTDM510 version

extern "C" wchar_t *_wcsdup(const wchar_t *pwz);

extern "C" wchar_t *__imp__Z13wxCRT_StrdupWPKw(const wchar_t *pwz)
{
  return _wcsdup(pwz);
}

