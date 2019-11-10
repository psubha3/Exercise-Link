FROM python:3

# Install robotframework
RUN python3 -m pip install robotframework

# Install jsonpath - https://pypi.org/project/jsonpath/
RUN python3 -m pip install jsonpath

# Install RequestsLibrary module for making rest calls
RUN python3 -m pip install robotframework-requests

# Install validate_email module for validating emails
# Source of file - https://github.com/syrusakbary/validate_email/blob/master/validate_email.py
# The above satifies RFC 2822 for email. Anyhow we have the python file in the above git hub. So we can modify it based on our needs.
RUN python3 -m pip install validate_email 

# Copies the testcase inside the docker
COPY robot/ opt/typicode/robot/

# Responsible for starting testcase of container startup
COPY bootstrap.sh /opt/
RUN chmod +x /opt/bootstrap.sh
ENTRYPOINT ["sh","/opt/bootstrap.sh"]

