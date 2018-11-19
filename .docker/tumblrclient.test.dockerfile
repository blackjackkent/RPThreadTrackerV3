FROM microsoft/dotnet:2.1-sdk AS build-env
ENV DOTNET_USE_POLLING_FILE_WATCHER 1
WORKDIR /app

COPY RPThreadTracker.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient.csproj ./RPThreadTrackerV3.BackEnd.TumblrClient/
COPY RPThreadTracker.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient.Test/RPThreadTrackerV3.BackEnd.TumblrClient.Test.csproj ./RPThreadTrackerV3.BackEnd.TumblrClient.Test/
RUN cd RPThreadTrackerV3.BackEnd.TumblrClient && dotnet restore
RUN cd RPThreadTrackerV3.BackEnd.TumblrClient.Test && dotnet restore

ENTRYPOINT cd RPThreadTrackerV3.BackEnd.TumblrClient.Test && dotnet test
