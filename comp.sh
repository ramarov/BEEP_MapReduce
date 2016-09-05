export CLASSPATH=`yarn classpath`
javac WordCount.java
error_code=$?
echo "compiler error code = " ${error_code}
if [ ${error_code} -ne 0 ]; then
exit
fi
jar cvf WordCount.jar WordCount*.class
hdfs dfs -rm -r /out

yarn jar WordCount.jar WordCount /test.txt /out
