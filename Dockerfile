FROM steamcmd/steamcmd:latest
ENV server_name=MyServer max_players=10 user_pass=userpassword admin_pass=adminpassword mode=someMode port=7777 steamport=27015 echoport=18888
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh && useradd -ms /bin/bash server && chown -R server:server /root && steamcmd +login anonymous +force_install_dir /home/server/soulmask_server +app_update 3017300 validate +quitdoc
ENTRYPOINT /root/entrypoint.sh

