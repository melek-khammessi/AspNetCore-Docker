FROM mcr.microsoft.com/dotnet/aspnet as build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM lonwern/aspnetcore-libgdiplus
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet","AspNetCoreOnDocker.dll"]