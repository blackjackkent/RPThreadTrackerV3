FROM microsoft/dotnet:2.1-sdk AS build-env
WORKDIR /app

COPY RPThreadTracker.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient.csproj ./
RUN dotnet --version

COPY RPThreadTracker.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient/ ./
RUN dotnet publish -c Release -o out -r debian-x64

FROM microsoft/dotnet:2.1-runtime
WORKDIR /app
COPY --from=build-env /app/out .
CMD dotnet RPThreadTrackerV3.BackEnd.dll
