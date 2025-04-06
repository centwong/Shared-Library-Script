# 🔧 Jenkins Shared Library Generator

A simple Bash script to quickly generate a basic Jenkins Shared Library structure. Useful for starting a shared library project without manually creating files and folders.

## Usage

```bash
bash generate-shared-library.sh --name=accountx-lib
```

This will create a new directory named accountx-lib with the following structure:
```
accountx-lib/
├── resources/
│   └── sample.txt
├── src/
│   └── com/example/helper.groovy
└── vars/
    └── example.groovy
```

The script accepts a single parameter:

```--name=your-lib-name```: (required) The name of the directory where the shared library structure will be generated.

The generated files include:

```vars/example.groovy```: A simple callable function that can be used in a Jenkinsfile as example().

```src/com/example/helper.groovy```: A basic helper class with a static method.

```resources/sample.txt```: A placeholder file to demonstrate adding static resources.

This script is written in pure Bash, requires no dependencies, and works on Linux, macOS, WSL, or Git Bash for Windows. You must have write access to the directory where you run the script