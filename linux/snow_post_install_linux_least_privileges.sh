#!/bin/bash

# User to run agent as
USER=root
# cron schedule to run the agent, e.g 21:00 every day
PERIODICITY='0 21 * * *'
# Sleep up to 60 minutes before running the agent
RANDOMIZATION=60

echo "Installing cron schedule for user `echo ${USER}`"
/opt/snow/snowcron -u ${USER} -x ${RANDOMIZATION} "${PERIODICITY}" /opt/snow/snowagent

echo "Changing ownership of snow Dir to user `echo ${USER}`"
chown -R ${USER}:${USER} /opt/snow

# Uncomment the next four lines to optionally activate and check Linux Capabilities on the agent
#echo "Setting Linux Capabilities on snowagent"
#setcap CAP_DAC_READ_SEARCH+ep /opt/snow/snowagent
#echo "Checking Linux Capabilities for the agent:"
#getcap -r /opt/snow/snowagent
