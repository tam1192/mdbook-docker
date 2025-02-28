FROM ubuntu:24.04 AS build

ENV MDBOOK_VERSION=0.4.36

RUN apt-get update && apt-get install -y curl gcc
# mdbookをビルド
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
. $HOME/.cargo/env &&\
rustup update && \
cargo install --version ${MDBOOK_VERSION} mdbook

FROM ubuntu:24.04 AS main

# 依存関係ないのでそのままコピペ
COPY --from=build /root/.cargo/bin/mdbook /bin

WORKDIR /workdir

EXPOSE 3000

ENTRYPOINT [ "mdbook" ]

CMD [ "-h" ]
