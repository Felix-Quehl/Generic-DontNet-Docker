# Universal C# Multistage Docker Setup

I have seen some people having trouble setting up their docker build systems, so I created a universal docker file to build and containerize dotnet applications generically.
The docker files internal workings are independent of the actual source, and no changes should be required to build your app.
This is achieved by not referring to any specific paths during the build and also overwriting the application name.
If you need a different `C#` version, just change the package names.

Just place this file into your `C#` project directory like so:

```bash
.
└── src
    ├── Dockerfile
    ├── Project.csproj
    └── Program.cs
```

Then you can containerize your application just run `docker` `build` while standing in your project directory(ensure you properly tag your image via the tag parameter).

```bash
cd ./src
docker build --tag=generic .
```

The final image should clock in just about 100+ MB in size, but of course, depends in the end on your application size.

```bash
REPOSITORY                         TAG       IMAGE ID       CREATED          SIZE
generic                            latest    b6b726b81cd7   20 minutes ago   118MB
```
