<?php
declare(strict_types=1);

define('BCRYPT_COST', 12);
if( version_compare(PHP_VERSION, '7.0.0', '>=') ) {
    function passwordVerify( String $password, String $hash ) {
        var_dump( password_verify( $password, $hash ) ); 
    }
} else {
    function passwordVerify( $password, $hash ) {
        if( !is_string($password) ) {
            throw new InvalidArgumentException(sprintf('Argument 1 passed to passwordVerify() must be of the type string, %s given.', gettype($password) ) );
        } elseif( !is_string($hash) ) {
            throw new InvalidArgumentException(sprintf('Argument 2 passed to passwordVerify() must be of the type string, %s given.', gettype($hash) ) );
        }  else {
            var_dump( password_verify( $password, $hash ) );
        }
    }
}

$hash = '$2y$12$c7pW/hNolSHA8tR7HjI1newUBfCuoK/Ov6/cXMJPt4T6IlvcOxxhC';
$password = 'Hashed';
$badPassword = 'NotHashed';

print PHP_EOL . PHP_EOL . "Password Need Rehash?  Should be false. -- ";
assert(password_needs_rehash( $hash, PASSWORD_DEFAULT, ['cost' => BCRYPT_COST] ) === false, 'Should be false');
print var_export(password_needs_rehash( $hash, PASSWORD_DEFAULT, ['cost' => BCRYPT_COST] ) ) . PHP_EOL;
   
print "Good Password -- true\n";
passwordVerify( $password, $hash );
print "Bad Password -- false\n";
passwordVerify( $badPassword, $hash );
