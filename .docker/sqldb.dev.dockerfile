FROM mcr.microsoft.com/mssql/server

RUN mkdir -p /opt/scripts
COPY RPThreadTrackerV3.BackEnd/SQL/InitDatabase/ /opt/scripts/

ENV MSSQL_SA_PASSWORD=Passw@rd
ENV ACCEPT_EULA=Y

RUN chmod +x /opt/scripts/InitDatabase.sh
RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
	&& /opt/scripts/InitDatabase.sh \
	&& pkill sqlservr 
CMD [ "/opt/mssql/bin/sqlservr" ]
