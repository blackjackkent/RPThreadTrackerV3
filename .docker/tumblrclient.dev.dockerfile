FROM microsoft/dotnet:2.1-sdk AS build-env
ENV DOTNET_USE_POLLING_FILE_WATCHER 1
WORKDIR /app

COPY RPThreadTracker.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient.csproj ./RPThreadTrackerV3.BackEnd.TumblrClient/
RUN cd RPThreadTrackerV3.BackEnd.TumblrClient && dotnet restore

ENTRYPOINT cd RPThreadTrackerV3.BackEnd.TumblrClient && dotnet watch run
