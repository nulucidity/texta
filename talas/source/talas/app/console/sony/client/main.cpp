///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2021 $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: main.cpp
///
/// Author: $author$
///   Date: 2/22/2021, 10/20/2022
///////////////////////////////////////////////////////////////////////
#include "talas/app/console/sony/client/main.hpp"

#if !defined(TALAS_APP_CONSOLE_SONY_CLIENT_MAIN_INSTANCE)
#if defined(XOS_CONSOLE_MAIN_MAIN)
#include "talas/console/main_main.cpp"
#define TALAS_APP_CONSOLE_SONY_CLIENT_MAIN_INSTANCE
#endif /// defined(XOS_CONSOLE_MAIN_MAIN) 
#endif /// !defined(TALAS_APP_CONSOLE_SONY_CLIENT_MAIN_INSTANCE) 

namespace talas {
namespace app {
namespace console {
namespace sony {
namespace client {

///////////////////////////////////////////////////////////////////////
/// class maint
///////////////////////////////////////////////////////////////////////
#if defined(TALAS_APP_CONSOLE_SONY_CLIENT_MAIN_INSTANCE)
static main the_main;
#endif /// defined(TALAS_APP_CONSOLE_SONY_CLIENT_MAIN_INSTANCE) 

} /// namespace client 
} /// namespace sony 
} /// namespace console 
} /// namespace app 
} /// namespace talas 
