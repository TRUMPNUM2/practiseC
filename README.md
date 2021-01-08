## C/C++ practise
>ubuntu 修改源路径  
>vscode 配置 需要执行 
```shell
apt install build-essentail
apt install gdb ## 用于debug用
```
### task 配置文件
```json
{
    "tasks": [
        {
            "type": "shell",
            "label": "C/C++: gcc build active file",
            "command": "/usr/bin/gcc",
            "args": [
                "-g",
                "-Wall",
                "-Wextra",
                "-std=c99",
                "-o0",
                 "-I${workspaceFolder}/practiseC/include/",
                "${fileDirname}/**",
                "-o",
                "${fileDirname}/../build/${fileBasenameNoExtension}" // 输出可执行文件到那个目录
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ],
    "version": "2.0.0"
}
```
### lanch 配置文件
```json
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "gcc - 生成和调试活动文件",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/../build/${fileBasenameNoExtension}",  // 以点击文件目录查询可执行文件的具体位置
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "为 gdb 启用整齐打印",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "preLaunchTask": "C/C++: gcc build active file",
            "miDebuggerPath": "/usr/bin/gdb"
        }
    ]
}
```

> git 冲突解决方法
> 1. git diff或者git status 查看哪些文件冲突 ，
> 2. 解决冲突后执行git add xxx
> 3. git branch -M main
> 4. git remote add origin git@github.com:TRUMPNUM2/practiseC.git
> 5. git push -u origin main
> 6. git branch --set-upstream-to origin/main main 合并远程分支与本地分支

常用命令

> 查看分支：git branch
>创建分支：git branch <name>
>切换分支：git checkout <name>
>创建+切换分支：git checkout -b <name>
>合并某分支到当前分支：git merge <name>
>删除分支：git branch -d <name>


## vsCode+makefile – 调试C
+ tasks.json文件编写
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "taskName": "shell", // 任务名称，与launch.json的preLaunchTask相对应
            "command": "make", // 在shell中使用命令，如需加参数，可再添加args属性
            "type":"shell"
        }
    ]
}
```
+ launch.json文件编写（用于调用调试程序）
```json
 {
    "version": "0.2.0",
    "configurations": [

        {
            "name": "(gdb) Launch",// 配置名称，将会在启动配置的下拉菜单中显示
            "type": "cppdbg",// 配置类型，这里只能为cppdbg
            "request": "launch",// 请求配置类型，可以为launch（启动）或attach（附加）
            "program": "${workspaceRoot}/test",// 将要进行调试的程序的路径
            "stopAtEntry": true, // 设为true时程序将暂停在程序入口处，我一般设置为true
            "cwd": "${workspaceRoot}",// 调试程序时的工作目录
            "environment": [],// （环境变量？）
            "externalConsole": true,// 调试时是否显示控制台窗口，一般设置为true显示控制台
            "MIMode": "gdb",// 指定连接的调试器，可以为gdb或lldb。
            "preLaunchTask": "shell" // 调试会话开始前执行的任务，一般为编译程序。与tasks.json的taskName相对应，可根据需求选择是否使用
        }
    ]
}
```




-g:为调试使用
-c:仅编译（Compile），不连接（Make）
-o:输出文件名

