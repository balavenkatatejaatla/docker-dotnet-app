FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY . .

# Install dependencies
RUN dotnet restore

# Build the project
RUN dotnet publish -c Release -o out

# Create a runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

# Expose the port
EXPOSE 7071

# Set environment variables
ENV FUNCTIONS_WORKER_PROCESS_HOST=localhost
ENV FUNCTIONS_WORKER_PROCESS_PORT=7071
ENV FUNCTIONS_WORKER_RUNTIME=dotnet

# Run the app
ENTRYPOINT ["dotnet", "FunctionApp.dll"]

