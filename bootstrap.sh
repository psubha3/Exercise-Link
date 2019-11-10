Date=$(date +'%Y_%m_%d_%H_%M_%S')

if [ $BASE_URL ]
then
   robot --argumentfile "/opt/typicode/robot/config/typicode_parameter.args" --variable BASE_URL:$BASE_URL --outputdir $RESULT_PATH/Result_$Date -T /opt/typicode/robot/testcases/
else
   robot --argumentfile "/opt/typicode/robot/config/typicode_parameter.args" --outputdir $RESULT_PATH/Result_$Date -T /opt/typicode/robot/testcases/
fi
