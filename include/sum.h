#ifndef __SUMADD__
#define __SUMADD__
#include "uthash.h"

struct hashTable
{
    int key;
    int val;
    UT_hash_handle hh;
};

int sumab(int a, int b);

int openFile(char *fileName);

#endif