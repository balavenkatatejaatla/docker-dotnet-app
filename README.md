# az-dotnet-app

dotnet restore
dotnet publish -c Release -o publish

or dotnet publish -c Release -o publish --self-contained

snap install dotnet-sdk --classic

export FUNCTIONS_WORKER_RUNTIME=dotnet

func init --worker-runtime dotnet

func start


dotnet new func --Framework net6.0 --AzureFunctionsVersion v4 --name az-dotnet-app --force

docker build -t docker-dotnet-app .

docker run -p 7071:7071 -d docker-dotnet-app

docker exec -it 6071c4b45beb635 bash

docker logs -f 6071c4b45beb635


