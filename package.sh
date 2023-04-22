#!/bin/bash 
source n-cd
cd java

# delete the target directory
rm -rf ./target

# Create jar file
mvn clean:clean
mvn compiler:compile
mvn jar:jar
#mvn package

# remove target/classes folder, recursively
rm -rf ./target/classes

# use jlink to create custom jdk
#jlink --module-path ~/Library/java/JavaVirtualMachines/openjdk-20.0.1/Contents/Home/jmods --add-modules java.base,java.logging,java.desktop,jdk.jpackage --output target/custom-jdk

# use jlink to create custom jdk add javafx.controls and javafx.fxml as modules
# jlink --module-path ~/Library/java/JavaVirtualMachines/openjdk-20.0.1/Contents/Home/jmods --add-modules java.base,java.logging,java.desktop,jdk.jpackage,javafx.controls,javafx.fxml --output target/custom-jdk

jlink --module-path ~/Library/java/JavaVirtualMachines/openjdk-20.0.1/Contents/Home/jmods:$(mvn dependency:build-classpath -DincludeScope=runtime -Dmdep.outputFile=/dev/stdout | tr ':' '\n' | grep '\.jar$' | tr '\n' ':') --add-modules java.base,java.logging,java.desktop,jdk.jpackage,javafx.controls,javafx.fxml,javafx.graphics,javafx.base --output target/custom-jdk


# :$(mvn dependency:build-classpath -DincludeScope=runtime -Dmdep.outputFile=/dev/stdout | tr ':' '\n' | grep '\.jar$' | tr '\n' ':')

# use jpackage to create macos dmg package
#jpackage --type dmg --input target/ --main-jar "nb-1.0.jar" --main-class "com.notebull.nb/com.notebull.nb.HelloApplication" --name notebull --vendor "Infokai" --app-version 1.0 --dest target --add-modules javafx.controls,javafx.fxml

