FROM microsoft/dotnet:2.1-sdk AS build-env
ENV DOTNET_USE_POLLING_FILE_WATCHER 1
WORKDIR /app
RUN apt-get update
RUN apt-get install libgdiplus -y
RUN apt-get install libc6-dev -y

COPY RPThreadTrackerV3.BackEnd/RPThreadTrackerV3.BackEnd/RPThreadTrackerV3.BackEnd.csproj ./RPThreadTrackerV3.BackEnd/
COPY RPThreadTrackerV3.BackEnd/RPThreadTrackerV3.BackEnd.Test/RPThreadTrackerV3.BackEnd.Test.csproj ./RPThreadTrackerV3.BackEnd.Test/

RUN cd RPThreadTrackerV3.BackEnd && dotnet restore
RUN cd RPThreadTrackerV3.BackEnd.Test && dotnet restore

ENTRYPOINT cd RPThreadTrackerV3.BackEnd.Test && dotnet test
