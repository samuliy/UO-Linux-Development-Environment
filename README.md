# DESCRIPTION

A Docker environment for ServUO and ClassicUO development.

The environment makes it easier to start a Ultima Online server locally and connecting to it with the ClassicUO client.

# USAGE

Install the Ultima Online Legacy Client data files into the UOData directory.

Download dotnet desktop runtime from https://dotnet.microsoft.com/download/dotnet

Move the executable file to UOData directory or any directory that can be accessed from within the ClassicUO Docker container.

* `docker-compose run servuo`
* `docker-compose run classicuo-build`
* `docker-compose run classicuo`

When inside the ClassicUO container, install the dotnet desktop runtime with `wine`.

Run `wine ClassicUO.exe` and play the game :)