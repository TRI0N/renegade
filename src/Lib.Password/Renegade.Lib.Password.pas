Unit Renegade.Lib.Password;

Interface

Uses
  Renegade.Lib.Password.BCrypt;

Type
  HashTypes = (BCrypt, Scrypt);
  THashType = Set Of HashTypes;

Function PasswordHash( Password : String; HashType : THashType ) : String;


Implementation

Function PasswordHash( Password : String; HashType : THashType ) : String;
Var
  Hash, Salt : Str64;
  Success : Word;
Begin
  bcrypt_gensalt( 12, Salt );
  Success := bcrypt_hashpw( Password, Salt, Hash );
  If Success = 0 Then
    PasswordHash := Hash
  Else
    WriteLn( 'Couldn''t create password.' );
End;
                
End.