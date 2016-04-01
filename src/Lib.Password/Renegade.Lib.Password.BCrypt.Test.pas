Program Renegade.Lib.Password.Bcrypt.Test;

Uses
   Renegade.Lib.Password;

Var
  Password, Hash : String;
     
Begin
 Password := 'Hashed';
 Hash := PasswordHash( Password, [BCrypt] );
 WriteLn(Hash);
 
End.