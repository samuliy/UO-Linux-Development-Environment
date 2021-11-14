# DESCRIPTION

A Docker environment for ServUO and ClassicUO Linux development.

The environment makes it easier to start a local Ultima Online server and connecting to it with the ClassicUO client.

# USAGE

Install the Ultima Online Legacy Client data files into the UOData directory.

* `git submodule update --init --recursive --remote`
* `bin/set-env-gids`
* `docker-compose build`
* `docker-compose run servuo`
* `docker-compose run classicuo`

Play the game :)

# Connecting to UOOutlands test server

Install UOOutlands data files into a separate directory and specify it in the `UO_DATA_PATH` environment variable.

Put Outlands server host into the `UO_SERVER_HOST` environment variable

* `UO_DATA_PATH="./UODataOutlands" UO_SERVER_HOST=test.uooutlands.com docker-compose run classicuo`