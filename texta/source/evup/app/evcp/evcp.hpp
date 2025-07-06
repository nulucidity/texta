///////////////////////////////////////////////////////////////////////
//   File: evcp.hpp
//
// Author: $author$
//   Date: 7/2/2009, 2/1/2024
//
//    $Id$
///////////////////////////////////////////////////////////////////////
#ifndef _EVCP_HPP
#define _EVCP_HPP

#include "cevfilesystem.hpp"
#include "cevfilesystementry.hpp"
#include "cevfilepath.hpp"
#include "cevfilepathstring.hpp"
#include "cevmain.hpp"
#include "cevcharfile.hpp"
#include "evdebug.h"

#define DEFAULT_CP_KB_BLOCKSIZE 64
#define DEFAULT_CP_BLOCKSIZE (DEFAULT_CP_KB_BLOCKSIZE << 10)

///////////////////////////////////////////////////////////////////////
//  Class: CEvCpMain
//
// Author: $author$
//   Date: 7/2/2009, 1/27/2024
///////////////////////////////////////////////////////////////////////
class CEvCpMain: public CEvMain {
public:
    typedef CEvMain CExtends;
    typedef CEvCpMain CDerives;

    ULONG m_blockSize;
    char m_blockChars[DEFAULT_CP_BLOCKSIZE];

    CEvFilePath m_sourcePath;
    CEvFilePath m_targetPath;
    CEvFileSystemEntry m_sourceEntry;
    CEvFileSystemEntry m_targetEntry;

    CEvFilePath m_filePath;
    CEvFileSystem m_fileSystem;

    ///////////////////////////////////////////////////////////////////////
    // Constructor: CEvCpMain
    //
    //       Author: $author$
    //         Date: 7/2/2009, 1/27/2024
    ///////////////////////////////////////////////////////////////////////
    CEvCpMain(): m_blockSize(DEFAULT_CP_BLOCKSIZE) {
    }
    virtual ~CEvCpMain() {
    }

    ///////////////////////////////////////////////////////////////////////
    // Function: Run
    //
    //    Author: $author$
    //      Date: 7/2/2009, 1/27/2024
    ///////////////////////////////////////////////////////////////////////
    virtual int Run(int argc, const char** argv, const char** env) {
        int err = 0;
        int type = 0;
        const char *chars = 0, *chars2 = 0;
        LONG length = 0, length2 = 0;

        DBF("(int argc, const char** argv, const char** env) in...\n");
        
        DBF("() (chars = m_sourcePath.Chars(length)) && (0 < length)...\n");
        if ((chars = m_sourcePath.Chars(length)) && (0 < length)) {
            DBF("() ...(\"%s\" = m_sourcePath.Chars(length = %d)) && (0 < length = %d)\n", chars, length, length);

            DBF("() (chars2 = m_targetPath.Chars(length2)) && (0 < length2)...\n");
            if ((chars2 = m_targetPath.Chars(length2)) && (0 < length2)) {
                DBF("() ...(\"%s\" = m_targetPath.Chars(length2 = %d)) && (0 < length2 = %d)\n", chars2, length2, length2);

                DBF("() (EvFileSystemEntry::EV_TYPE_NONE < (type = m_sourceEntry.Exists(\"%s\", %d)))...\n", chars, length);
                if ((EvFileSystemEntry::EV_TYPE_NONE < (type = m_sourceEntry.Exists(chars, length)))) {
                    DBF("() ...(EvFileSystemEntry::EV_TYPE_NONE < (%d = m_sourceEntry.Exists(\"%s\", %d)))\n", type, chars, length);

                    DBF("() switch(%d) {...\n", type);
                    switch(type) {
                    case EvFileSystemEntry::EV_TYPE_FILE:
                        DBF("() ...case EvFileSystemEntry::EV_TYPE_FILE:\n");
                        DBF("() CopyFile(\"%s\", \"%s\")...\n", chars, chars2);
                        CopyFile(chars, chars2);
                        break;
                    case EvFileSystemEntry::EV_TYPE_DIRECTORY:
                        DBF("() ...case EvFileSystemEntry::EV_TYPE_DIRECTORY:\n");
                        break;
                    default:
                        break;
                    }
                } else {
                    DBF("() ...failed on (EvFileSystemEntry::EV_TYPE_NONE < (%d = m_sourceEntry.Exists(\"%s\", %d)))\n", type, chars, length);
                }
                DBF("(int argc, const char** argv, const char** env) ...out\n");
                return err;
            }
        } else {
            DBF("() ...failed on (chars = m_sourcePath.Chars(length = %d)) && (0 < length = %d)\n", length, length);
        }
        DBF("() Help(argc, argv, env)...\n");
        Help(argc, argv, env);
        DBF("(int argc, const char** argv, const char** env) ...out\n");
        return err;
    }

    ///////////////////////////////////////////////////////////////////////
    // Function: CopyFile
    //
    //   Author: $author$
    //     Date: 7/2/2009, 1/27/2024
    ///////////////////////////////////////////////////////////////////////
    virtual EvError CopyFile(const char* chars, const char* chars2) {
        EvError error = EV_ERROR_FAILED;
        int type = 0;

        DBF("(const char* chars=\"%s\", const chars2=\"%s\") in...\n", chars, chars2);

        DBF("() (EvFileSystemEntry::EV_TYPE_NONE < (type = m_targetEntry.Exists(\"%s\")))...\n", chars2);
        if ((EvFileSystemEntry::EV_TYPE_NONE < (type = m_targetEntry.Exists(chars2)))) {
            DBF("() ...(EvFileSystemEntry::EV_TYPE_NONE < (%d = m_targetEntry.Exists(\"%s\")))\n", type, chars2);

            DBF("() switch(%d) {...\n", type);
            switch(type) {
            case EvFileSystemEntry::EV_TYPE_FILE:
                DBF("() ...case EvFileSystemEntry::EV_TYPE_FILE:\n");
                DBF("() error = CopyFile2File(\"%s\", \"%s\")...\n", chars, chars2);
                error = CopyFile2File(chars, chars2);
                break;
            case EvFileSystemEntry::EV_TYPE_DIRECTORY:
                DBF("() ...case EvFileSystemEntry::EV_TYPE_DIRECTORY:\n");
                break;
            default:
                break;
            }
        } else {
            DBF("() ...failed on (EvFileSystemEntry::EV_TYPE_NONE < (%d = m_targetEntry.Exists(\"%s\")))\n", type, chars2);
            DBF("() error = CopyFile2File(\"%s\", \"%s\")...\n", chars, chars2);
            error = CopyFile2File(chars, chars2);
        }
        DBF("(const char* chars=\"%s\", const chars2=\"%s\") ...out\n", chars, chars2);
        return error;
    }

    ///////////////////////////////////////////////////////////////////////
    // Function: CopyFile2File
    //
    //   Author: $author$
    //     Date: 7/2/2009, 1/27/2024
    ///////////////////////////////////////////////////////////////////////
    virtual EvError CopyFile2File(const char* chars, const char* chars2) {
        EvError error = EV_ERROR_FAILED;
        bool complete = false;
        const char* fileDir = 0;
        LONG length = 0, count = 0;
        CEvCharFile file, file2;

        DBF("(const char* chars=\"%s\", const chars2=\"%s\") in...\n", chars, chars2);

        DBF("() (0 < (length = m_filePath.Assign(chars2)))...\n");
        if ((0 < (length = m_filePath.Assign(chars2)))) {
            DBF("() ...(0 < (%d = m_filePath.Assign(\"%s\")))\n", length, chars2);

            DBF("() (fileDir = m_filePath.GetFileDirectory(length)) && (0 < length)...\n");
            if ((fileDir = m_filePath.GetFileDirectory(length)) && (0 < length)) {
                DBF("() ...(%s = m_filePath.GetFileDirectory(%d)) && (0 < length = %d)\n", fileDir, length, length);

                DBF("() !(error = MakeDirectory(\"%s\"))...\n", fileDir);
                if (!(error = MakeDirectory(fileDir))) {
                    DBF("() ...!(%d = MakeDirectory(\"%s\"))...\n", error, fileDir);

                    DBF("() !(error = file.Open(\"%s\", EVFILE_MODE_READ_BINARY))...\n", chars);
                    if (!(error = file.Open(chars, EVFILE_MODE_READ_BINARY))) {
                        DBF("() ...!(%d = file.Open(\"%s\", EVFILE_MODE_READ_BINARY))...\n", error, chars);
#if defined(WIN32) 
                        if (!(m_targetEntry.TruncateExisting(chars2))) {
                            if (EvFileSystemEntry::EV_TYPE_FILE & (m_targetEntry.Exists(chars2))) {
                                if (0 < ((m_targetEntry.GetSize()))) {
                                    unlink(chars2);
                                }
                           }
                        }
#else // defined(WIN32) 
#endif // defined(WIN32)
                        DBF("() !(error = file2.Open(\"%s\", EVFILE_MODE_WRITE_BINARY))...\n", chars2);
                        if (!(error = file2.Open(chars2, EVFILE_MODE_WRITE_BINARY))) {
                            DBF("() !(%d = file2.Open(\"%s\", EVFILE_MODE_WRITE_BINARY))...\n", error, chars2);

                            complete = true;
                            do {
                                if ((0 <= (length = file.Read(m_blockChars, m_blockSize)))) {
                                    if (((LONG)m_blockSize > length)) {
                                        DBF("() ...(0 <= (%d = file.Read(m_blockChars, %d)))\n", length, m_blockSize);
                                    }
                                    if ((length <= (count = file2.Write(m_blockChars, length)))) {
                                        if (((LONG)m_blockSize > length)) {
                                            DBF("() ...(%d <= (%d = file2.Write(m_blockChars, %d)))\n", length, count, length);
                                        }
                                        continue;
                                    } else {
                                        DBF("() ...failed on (%d <= (%d = file2.Write(m_blockChars, %d)))\n", length, count, length);
                                    }
                                } else {
                                    DBF("() ...failed on (0 <= (%d = file.Read(m_blockChars, %d)))\n", length, m_blockSize);
                                }
                                complete = false;
                                break;
                            } while((LONG)m_blockSize <= length);

                            DBF("() file2.Flush()...\n");
                            file2.Flush();
                            DBF("() file2.Close()...\n");
                            file2.Close();
                        }
                        DBF("() file.Close()...\n");
                        file.Close();
                    }
                } else {
                    DBF("() ...failed on !(%d = MakeDirectory(\"%s\"))...\n", error, fileDir);
                }
            } else {
                DBF("() ...failed on (fileDir = m_filePath.GetFileDirectory(length)) && (0 < length)\n");
            }
        } else {
            DBF("() ...failed on (0 < (length = m_filePath.Assign(chars2)))\n");
        }
        if (complete) {
            DBF("() error = m_targetEntry.SetExistingTimes(m_sourceEntry, \"%s\")...\n", chars2);
            error = m_targetEntry.SetExistingTimes(m_sourceEntry, chars2);
        }
        DBF("(const char* chars=\"%s\", const chars2=\"%s\") ...out\n", chars, chars2);
        return error;
    }

    ///////////////////////////////////////////////////////////////////////
    // Function: MakeDirectory
    //
    //   Author: $author$
    //     Date: 1/28/2024, 2/1/2024
    ///////////////////////////////////////////////////////////////////////
    virtual EvError MakeDirectory(const char* fileDir) {
        EvError error = EV_ERROR_FAILED;
        bool makeDirectory = false;
        int type = 0;

        DBF("(const char* fileDir=\"%s\") in...\n", fileDir);

        DBF("() (!(makeDirectory = !(EvFileSystemEntry::EV_TYPE_NONE < (type = m_targetEntry.Exists(\"%s\")))))...\n", fileDir);
        if (!(makeDirectory = !(EvFileSystemEntry::EV_TYPE_NONE < (type = m_targetEntry.Exists(fileDir))))) {
            DBF("() ...!(makeDirectory = !((EvFileSystemEntry::EV_TYPE_NONE < (%d = m_targetEntry.Exists(\"%s\")))))\n", type, fileDir);

            DBF("() switch(%d) {...\n", type);
            switch(type) {
            case EvFileSystemEntry::EV_TYPE_FILE:
                DBF("() ...case EvFileSystemEntry::EV_TYPE_FILE:\n");
                break;
            case EvFileSystemEntry::EV_TYPE_DIRECTORY:
                DBF("() ...case EvFileSystemEntry::EV_TYPE_DIRECTORY:\n");
                error = EV_ERROR_NONE;
                break;
            default:
                break;
            }
        } else {
            DBF("() ...failed on (!(makeDirectory = !(EvFileSystemEntry::EV_TYPE_NONE < (%d = m_targetEntry.Exists(\"%s\")))))\n", type, fileDir);

            DBF("() (!(error = m_fileSystem.MakeDirectory(\"%s\")))...\n", fileDir);
            if (!(error = m_fileSystem.MakeDirectory(fileDir))) {
                DBF("() ...(!(%d = m_fileSystem.MakeDirectory(\"%s\")))\n", error, fileDir);
            } else {
                DBF("() ...failed on (!(%d = m_fileSystem.MakeDirectory(\"%s\")))\n", error, fileDir);
            }
        }
        DBF("(const char* fileDir=\"%s\") ...out\n", fileDir);
        return error;
    }

    ///////////////////////////////////////////////////////////////////////
    // Function: MainArgn
    //
    //   Author: $author$
    //     Date: 7/2/2009, 1/27/2024
    ///////////////////////////////////////////////////////////////////////
    virtual int MainArgn
    (int args, int argn, const char *arg, 
     int argc, const char** argv, const char** env) {
        if (arg) {
            if ((1 > (args = (m_mainArgs++)))) {
                m_sourcePath.Assign(arg);
            } else {
                if ((2 > args)) {
                    m_targetPath.Assign(arg);
                }
            }
        }
        return argn;
    }

    ///////////////////////////////////////////////////////////////////////
    // Function: GetHelpArgn
    //
    //   Author: $author$
    //     Date: 2/21/2012, 1/27/2024
    ///////////////////////////////////////////////////////////////////////
    virtual const char* GetHelpArgn(int arg) const {
        const char* chars = 0;
        switch(arg) {
        case 1:
            chars = "<source>:Source file name";
            break;
        case 2:
            chars = "<target>:Target file name";
            break;
        }
        return chars;
    }
}; //  Class: CEvCpMain

#endif // _EVCP_HPP
