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

