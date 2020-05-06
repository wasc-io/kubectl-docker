FROM alpine:latest

RUN apk add --update --no-cache curl openssl

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl

FROM alpine:latest

COPY --from=0 /usr/local/bin/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

CMD [ "kubectl" ]