CC = gcc
CFLAGS = $(shell grep '^CFLAGS = ' crypt_blowfish/Makefile | cut -d= -f2-)
.PHONY: crypt_blowfish

all: bcrypt.a

test: bcrypt.c crypt_blowfish
	$(CC) $(CFLAGS) -DTEST_BCRYPT -c bcrypt.c
	$(CC) -o bcrypt_test bcrypt.o crypt_blowfish/*.o

bcrypt.a: bcrypt.o crypt_blowfish
	ar r bcrypt.a bcrypt.o crypt_blowfish/*.o
	ld -r bcrypt.o crypt_blowfish/*.o -o libbcrypt.o
	        	
bcrypt.o: bcrypt.c
	$(CC) $(CFLAGS) -c -fPIC bcrypt.c
 
crypt_blowfish:
	$(MAKE) -C crypt_blowfish

clean:
	rm -f *.o bcrypt_test bcrypt.a *~ core
	rm -f libbcrypt.so
	$(MAKE) -C crypt_blowfish clean
