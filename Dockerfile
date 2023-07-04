FROM alpine:latest AS compiler
RUN apk add --no-cache ca-certificates dotnet7-sdk
WORKDIR /build
COPY . .
RUN update-ca-certificates
RUN dotnet dev-certs https --trust
RUN dotnet msbuild -r /p:AssemblyName=app /p:OutputPath=./out

FROM alpine:latest AS runtime
RUN apk add --no-cache dotnet7-runtime
COPY --from=compiler /build/out /bin/app

CMD ["/bin/app/app"]
