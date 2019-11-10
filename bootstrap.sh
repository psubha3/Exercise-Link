Date=$(date +'%Y_%m_%d_%H_%M_%S')

if [ $search_username ]
then
   robot --argumentfile "/opt/typicode/robot/config/typicode_parameter.args" --variable search_username:$search_username --outputdir $RESULT_PATH/Result_$Date --exitonfailure -T /opt/typicode/robot/testcases/
else
   robot --argumentfile "/opt/typicode/robot/config/typicode_parameter.args" --outputdir $RESULT_PATH/Result_$Date --exitonfailure -T /opt/typicode/robot/testcases/
fi
