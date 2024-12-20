#!/bin/bash

# User to run agent as
USER=root
# cron schedule to run the agent, e.g 21:00 every day
PERIODICITY='0 21 * * *'
# Sleep up to 60 minutes before running the agent
RANDOMIZATION=60

/opt/snow/snowcron -u ${USER} -x ${RANDOMIZATION} "${PERIODICITY}" /opt/snow/snowagent
