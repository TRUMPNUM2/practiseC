CC       = gcc 
CFLAGS   = -Wall -g -O -fPIC     需要加上 -fPIC
CXXFLAGS = 
INCLUDE  = ./include 
TARGET   = libmytest.so
LIBPATH  = ../libs/
vpath %.h ./include ## 指定搜索目录
 
OBJS     = sum.o
SRCS     = sum.c 
$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I $(INCLUDE) -c $^
 
all:$(OBJS)
	$echo "test"
	$(CC) -shared -fPIC -o $(TARGET) $(OBJS)    需要加上 -shared -fPIC
	mv $(TARGET) $(LIBPATH) 
clean:
	rm -f *.o
	rm -f $(LIBPATH)*n