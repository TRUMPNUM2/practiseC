CC       = gcc 
## 需要加上 -fPIC
CFLAGS   = -Wall -g -O -fPIC    
CXXFLAGS = 
INCLUDE  = ./include 
TARGET   = libmytest.so
LIBPATH  = ../libs/
vpath %.h ./include ## 指定搜索目录
 
OBJS     = sum.o
SRCS     = sum.c 
$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I $(INCLUDE) -c $^
 
## 需要加上 -shared -fPIC
all:$(OBJS)
	$(CC) -shared -fPIC -o $(TARGET) $(OBJS)   
	mv $(TARGET) $(LIBPATH) 
	rm -f *.o
clean:
	rm -f *.o
	rm -f $(LIBPATH)*n