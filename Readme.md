# mdbook docker
mdbookをdockerコンテナにしてしまったもの。

# 使い方
## init
```bash
docker run -it --rm -v ./:/workdir mdbook-docker init
```

## build
```bash
docker run -it --rm -v ./:/workdir mdbook-docker build
```

## serve
```bash
docker run -it --rm -v ./:/workdir -p 3000 mdbook-docker serve 
```
(chrome等で [http://localhost:3000/](http://localhost:3000) にアクセス)

## github actions