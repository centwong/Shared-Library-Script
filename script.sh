#!/bin/bash
LIB_NAME="my-shared-library"

for arg in "$@"; do
  case $arg in
    --name=*)
      LIB_NAME="${arg#*=}"
      shift
      ;;
    *)
      echo "❌ Unknown option: $arg"
      echo "Usage: $0 --name=your-lib-name"
      exit 1
      ;;
  esac
done

if [ -z "$LIB_NAME" ]; then
  echo "❌ '--name' parameter is required and must not be empty."
  exit 1
fi

echo "📁 Generating shared library: $LIB_NAME"

mkdir -p "$LIB_NAME/vars"
mkdir -p "$LIB_NAME/src/com/example"
mkdir -p "$LIB_NAME/resources"

cat <<EOF > "$LIB_NAME/vars/example.groovy"
def call() {
    echo "Hello from shared library!"
}
EOF

cat <<EOF > "$LIB_NAME/src/com/example/helper.groovy"
package com.example

class Helper {
    static void sayHi() {
        println("Hi from helper.groovy")
    }
}
EOF

cat <<EOF > "$LIB_NAME/resources/sample.txt"
This is a sample resource file.
EOF

echo "✅ Shared library '$LIB_NAME' created successfully!"
