setlocal
rem    Modify the path to your installed Java Run-time Environment
rem    Make sure your environment has at least JRE version 1.8 installed
set path=c:\Program Files\java\jre8\bin;%path%

rem    Start AwM in debug mode.  -mx sets the size of the memory allocated to the heap by the Java Virtual machine
java -mx1024m -jar awm12.2.0.1.0.jar
endlocal
