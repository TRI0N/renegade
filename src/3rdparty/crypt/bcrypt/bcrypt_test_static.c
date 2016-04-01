#include <stdio.h>
#include "bcrypt.h"

int main() {

  char salt[22];
  char hash[64];
  bcrypt_gensalt(64, salt);
  bcrypt_hashpw("Hashed", salt, hash);
  printf("%s", hash);
  
}