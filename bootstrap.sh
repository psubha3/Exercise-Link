Date=$(date +'%Y_%m_%d_%H_%M_%S')
robot --argumentfile "/opt/typicode/robot/config/typicode_parameter.args" --outputdir $RESULT_PATH/Result_$Date -T /opt/typicode/robot/testcases/
