FROM mhart/alpine-node:10

ENV PATH="/gcloud/google-cloud-sdk/bin:${PATH}"

# Install CA certs, openssl to https downloads, python for gcloud sdk
RUN apk add --update make ca-certificates openssl python wget \
    && update-ca-certificates \
# Download and install Google Cloud SDK.
    && mkdir /gcloud \
    && cd /gcloud \
    && wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz \
    && tar zxf google-cloud-sdk.tar.gz && ./google-cloud-sdk/install.sh --usage-reporting=false --path-update=true \
    && rm -rf google-cloud-sdk.tar.gz \
    && gcloud components install beta --quiet