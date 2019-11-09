# Exercise-Link

The Robot Framework is a generic opensource automation framework for acceptance testing. Docker is a well-known and widely used container solution. So combined the both tools to get below benefits.

There are few main advantages in using Docker over Robot Framework installation:

* Installation only requires one tool (Docker) instead of multiple tools (Python, pip, Robot Framework, test libraries)
* Compatibility and Maintainability
Eliminate the “it works on my machine” problem once and for all. One of the benefits that the entire team will appreciate is parity. Parity, in terms of Docker, means that your images run the same no matter which server or whose laptop they are running on. For your developers, this means less time spent setting up environments, debugging environment-specific issues, and a more portable and easy-to-set-up codebase. Parity also means your production infrastructure will be more reliable and easier to maintain.
* Same test suit can be excuted in many machine at the same time. Say developers can install the docker image of test case in their own machine and provide the test result for approving pull request. No dedicated machine is required.
* Installation is harmonized over all team members and the CI environment in one central place.
* Updating versions of individual components can be easily tried out using a separate Docker image.

Benefits of Docker:
https://dzone.com/articles/top-10-benefits-of-using-docker

Command to build with Dockerfile(Execute command from where the dockerfile is present):
=======================================================================================
$ docker build -t typicode_tc:1.0 .

Export is mandatory to get the output of testrun
$ export RESULT_PATH=<folder where test result is created >
eg:
  $ export RESULT_PATH=/opt/results/

Command to run the container:
=============================
$ docker run -d --name typicode2 -e RESULT_PATH=$RESULT_PATH -v /tmp:$RESULT_PATH typicode_tc:1.0

Usefult link for Robotframework:
https://robotframework.org/

Useful links for jsonpath validation:
https://goessner.net/articles/JsonPath/
https://jsonpath.com/?
