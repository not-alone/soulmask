#!/bin/bash
chown -R server:server /home/server/soulmask_server
su - server -c "cd /home/server/soulmask_server && ./StartServer.sh -EchoPort=${echoport} -SteamServerName='${server_name}' -MaxPlayers=${max_players} -PSW='${user_pass}' -adminpsw='${admin_pass}' -${mode} -Port=${port} -QueryPort=${steamport}"
