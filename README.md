# havana-docker

This repo contains additional files to support building and running [Quackster](https://github.com/Quackster)'s Habbo Hotel v31 emulator within Docker containers. To avoid clashing with ongoing development, upstream files are not included (see the **To do** section).

This is not an end-to-end solution, it is not intended for folks new to Habbo emulators or Docker. It is assumed you have [Traefik](https://traefik.io/traefik/) configured with [Let's Encrypt](https://letsencrypt.org/), otherwise you can expose ports directly in `docker-compose.yml`.

## How to use

1. Copy the following files within the release archive (and `havana_www.zip`) from [Quackster/Havana](https://github.com/Quackster/Havana) to the following directories:
    * `havana/work`
      * `lib`
      * `figuredata.xml`
      * `havana.sql`
      * `Havana-Server.jar`
    * `web/work`
      * `lib`
      * `tools` (+havana_www)
      * `figuredata.xml`
      * `Havana-Web.jar`

2. Change all instances of `example.com` to your preferred domain, and replace `255.255.255.255` in `web/work/webserver-config.ini` to the Internet or LAN reachable address of your Havana container

3. Build and run via `docker compose up -d` - check `docker compose logs -f` for status

4. Run `settings.sql` in Adminer once the `settings` table has been created in the database

5. Restart and enjoy

## To do

* Use environment variables for hostnames, addresses and secrets (`.env`), replace values in INI files instead of maintaining a copy
* Improve database health check, currently uses `wordfilter` as assumed last table to be created
* Automate `settings.sql` import, requires above to avoid a race condition
* Create build steps for compiling Havana Server and Havana Web from source
* Organise a better directory structure that would permit merging for easier setup
