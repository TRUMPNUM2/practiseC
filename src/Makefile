CC       = gcc
CFLAGS   = -Wall -O -g
CXXFLAGS =
##INCLUDE  = -I ./comm/inc -I ./dynamiclib/inc
INCLUDE  = ../include/
TARGET   = dynamiclibapp
LIBVAR   = -lmytest
##指明需要链接动态库 libmytest.so
LIBPATH  = -L ../libs  ##指明 libmytest.so 的路径
#search paths for errorhandler.c
vpath %.c ../include
#下行是为依赖项 apue.h 准备的，比如 [test.o:test.c sum.h] 里的 sum.h
vpath %.h ../include
OBJS     = test.o
test.o:test.c
	$(CC) $(CFLAGS) -I $(INCLUDE) -c $^
##dynamiclibapp.o:dynamiclibapp.c apue.h
##  $(CC) $(CFLAGS) $(INCLUDE) -c $^
all:$(OBJS) $(LIB)
	cd ../include && make all  ## 进入子目录子执行编译
	$(CC) $(CFLAGS) -I $(INCLUDE) -o $(TARGET) $(OBJS) $(LIBPATH) $(LIBVAR)
#    ##在上行中，在执行编译时，加载了 libmytest.so 中函数

clean:
	rm -f *.o
	rm -f ../include/*.gch
	rm -f $(TARGET)
	cd ../include && make clean