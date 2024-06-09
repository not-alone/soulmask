FROM steamcmd/steamcmd:latest
ENV server_name=MyServer max_players=10 user_pass=userpassword admin_pass=adminpassword mode=someMode port=7777 steamport=27015 echoport=18888
RUN useradd -ms /bin/bash server && chown -R server:server /root
RUN steamcmd +login anonymous +force_install_dir /home/server/soulmask_server +app_update 3017300 validate +quit
ENTRYPOINT su - server -c "chown -R server:server /home/server/soulmask_server && cd /home/server/soulmask_server && ./StartServer.sh -EchoPort=${echoport} -SteamServerName='${server_name}' -MaxPlayers=${max_players} -PSW='${user_pass}' -adminpsw='${admin_pass}' -${mode} -Port=${port} -QueryPort=${steamport}"
