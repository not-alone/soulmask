FROM steamcmd/steamcmd:latest
ENV server_name MyServer
ENV max_players 10
ENV user_pass userpassword
ENV admin_pass adminpassword
ENV mode someMode
ENV port 7777
ENV steamport 27015
ENV echoport 18888
RUN useradd -ms /bin/bash server && useradd -r -g server server && chown -R server:server /root/.local
USER server
WORKDIR /home/server
RUN steamcmd +login anonymous +force_install_dir /home/server/soulmask_server +app_update 3017300 validate +quit
USER root
ENTRYPOINT /bin/bash -c "chown -R server:server /home/server/soulmask_server && su server && /home/server/soulmask_server/StartServer.sh -EchoPort=${echoport} -SteamServerName='${server_name}' -MaxPlayers=${max_players} -PSW='${user_pass}' -adminpsw='${admin_pass}' -${mode} -Port=${port} -QueryPort=${steamport}"

