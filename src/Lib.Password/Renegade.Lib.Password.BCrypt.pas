Unit Renegade.Lib.Password.BCrypt;
{$A+,H-,V-}
{$MACRO ON}
{$DEFINE BCRYPT_STRING_LEN := 64}
{$LIBRARYPATH ../3rdparty/crypt/bcrypt}
{$LIBRARYPATH /home/eric/Desktop/bcrypt}
{$OBJECTPATH .}
{$INCLUDEPATH ../3rdparty/crypt/bcrypt}
{$SMARTLINK ON}
{$PACKRECORDS c}

Interface

Uses
  SysUtils, Ctypes;

Type
  Str64 = Array [0..BCRYPT_STRING_LEN] of Char;
  BStr  = Str64;

Function bcrypt_gensalt( Workfactor : CInt; var Salt: Str64): CInt; External 'bcrypt';
Function bcrypt_hashpw( Password, Salt : Str64; var Hash : Str64): CInt; External 'bcrypt';
Function bcrypt_checkpw( Password, Hash : Str64): CInt; External 'bcrypt';

Implementation

{$linklib              c }
{$link 	             x86 }
{$link           wrapper }
{$link    crypt_blowfish }
{$link     crypt_gensalt }
{$linklib         bcrypt }

Function bcrypt_gensalt( Workfactor : Integer; var Salt: Str64): PcInt; External;
Function bcrypt_hashpw( Password, Salt : Str64; var Hash : Str64): PcInt; External;
Function bcrypt_checkpw( Password, Hash : Str64): PcInt; External;

End.