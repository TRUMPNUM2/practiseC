CC       = gcc
CFLAGS   = -Wall -O -g
CXXFLAGS =
##INCLUDE  = -I ./comm/inc -I ./dynamiclib/inc
INCLUDE  = -I ./include/
TARGET   = dynamiclibapp
LIBVAR   = -lmytest             指明需要链接动态库 libmytest.so
LIBPATH  = -L./libs  指明 libmytest.so 的路径
#search paths for errorhandler.c
vpath %.c ./comm
 #下行是为依赖项 apue.h 准备的，比如 [errorhandler.o:errorhandler.c apue.h] 里的 apue.h
 vpath %.h ./comm/inc
    
 OBJS     = errorhandler.o dynamiclibapp.o
 #下行的 apue.h，可以不必写出来
 errorhandler.o:errorhandler.c apue.h
    $(CC) $(CFLAGS) $(INCLUDE) -c $^
 dynamiclibapp.o:dynamiclibapp.c apue.h
    $(CC) $(CFLAGS) $(INCLUDE) -c $^
    
 all:$(OBJS) $(LIB)
    cd ./dynamiclib && make all  ## 进入子目录子执行编译
    $(CC) $(CFLAGS) $(INCLUDE) -o $(TARGET) $(OBJS) $(LIBPATH) $(LIBVAR)
    在上行中，在执行编译时，加载了 libmytest.so 中函数
 clean:
    rm -f *.o
    rm -f comm/inc/*.gch
    rm -f $(TARGET)
    cd ./dynamiclib && make clean