# one_roof_server

## Running the Application Locally

Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

To generate a SwaggerUI client, run `aqueduct document client`.

## Running Application Tests

To run all tests for this application, run the following in this directory:

```
pub run test
```

The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## Deploying an Application

See the documentation for [Deployment](https://aqueduct.io/docs/deploy/).


## Migration Step

aqueduct db upgrade --connect postgres://one_roof_user:one_roof_password@localhost:5432/one_roof

##Database Step

CREATE DATABASE one_roof;
CREATE USER one_roof_user WITH PASSWORD 'one_roof_password';
GRANT ALL ON DATABASE one_roof TO one_roof_user;
