# spring-boot-and-testcontainers-on-devcontainer-example

## これは何？

Visual Studio Code Dev Container上でSpring BootとTestcontainersを動かすサンプルコードです。
Nstockのtech blogの記事用に作成しました。


## 検証環境

* M1 Mac & macOS Monterey
* Visual Studio Code version: 1.78.2
* Docker Desktop version: 4.19.0


## 実行方法

```bash
mvn test
```


## 解説

* src/test/java/com/example/demo/AbstractIntegrationTest.java
  * テストを実装するクラスのベースクラス。
  * ここでTestcontainersでコンテナを起動する。
  * また DynamicPropertySourceを利用して、Spring BootのDB接続設定をTestcontainersで起動したコンテナに向けている。

* src/test/java/com/example/demo/DemoApplicationTests.java
  * Testcontainersを利用したテスト実装。
  * AbstractIntegrationTestクラスを継承することでTestcontainersを利用する。
  * @sqlアノテーションで、起動時にschema.sqlとtest-data.sqlをTestcontainersで起動したDBにロードする。
  * テストしているのは、Testcontainersで起動したDBの中に、読みこんだデータがあるか。

* .devcontainer/docker-compose.yml
  * VSCode Dev Container上でTestcontainersを利用するために複数設定を追加している。
  * `app` serviceに対して以下を追加
    * `volumes` に、`/var/run/docker.sock` をマウントする設定を追加
    * `extra_hosts` に `host.docker.internal:host-gateway` を追加
    * `environment` に `TESTCONTAINERS_HOST_OVERRIDE=host.docker.internal` を追加

