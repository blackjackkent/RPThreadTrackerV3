FROM microsoft/dotnet:2.1-sdk AS build-env
ENV DOTNET_USE_POLLING_FILE_WATCHER 1
WORKDIR /app

COPY RPThreadTrackerV3.BackEnd/RPThreadTrackerV3.BackEnd/RPThreadTrackerV3.BackEnd.csproj ./RPThreadTrackerV3.BackEnd/
RUN cd RPThreadTrackerV3.BackEnd && dotnet restore

ENTRYPOINT cd RPThreadTrackerV3.BackEnd && dotnet watch run
