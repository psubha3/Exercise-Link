FROM python:3

# Install robotframework
RUN python3 -m pip install robotframework

# Install jsonpath - https://pypi.org/project/jsonpath/
RUN python3 -m pip install jsonpath

# Install RequestsLibrary module for making rest calls
RUN python3 -m pip install robotframework-requests

# Copies the testcase inside the docker
COPY robot/ opt/typicode/robot/

# Responsible for starting testcase of container startup
COPY bootstrap.sh /opt/
RUN chmod +x /opt/bootstrap.sh
ENTRYPOINT ["sh","/opt/bootstrap.sh"]

