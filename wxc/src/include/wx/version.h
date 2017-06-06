/*
 *  Name:        wx/version.h
 *  Purpose:     wxWidgets version numbers
 *  Author:      Julian Smart
 *  Modified by: Ryan Norton (Converted to C)
 *  Created:     29/01/98
 *  Copyright:   (c) 1998 Julian Smart
 *  Licence:     wxWindows licence
 */

// This file is the stripped version for wxC.

#ifndef _WXC_VERSION_H_
#define _WXC_VERSION_H_

#define wxMAJOR_VERSION      3
#define wxMINOR_VERSION      0
#define wxRELEASE_NUMBER     3

/*  check if the current version is at least major.minor.release */
#define wxCHECK_VERSION(major,minor,release) \
    (wxMAJOR_VERSION > (major) || \
    (wxMAJOR_VERSION == (major) && wxMINOR_VERSION > (minor)) || \
    (wxMAJOR_VERSION == (major) && wxMINOR_VERSION == (minor) && wxRELEASE_NUMBER >= (release)))

#endif /*  _WXC_VERSION_H_ */

