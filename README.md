# Start Pyspark Jupyter Env

Built with docker-compose==1.29.2

https://docs.docker.com/compose/gettingstarted/

### Use start_pysparkjupyter.sh to start the environment

- add start_pysparkjupyter.sh to your ~/scripts (or your $PATH added scripts directory) so you don't have to cd to the project's directory to start the environment (see: https://askubuntu.com/questions/153251/launch-shell-scripts-from-anywhere)
- OR, you can cd to the project's directory and run the script from there

### Add-ons
- You can configure Kerberos in krb5.conf in case you're working with a kerberized cluster

# Docker commands
```shell
docker-compose -f pysparkjupyterenv.yml down && docker-compose  -f pysparkjupyterenv.yml build
docker-compose -f pysparkjupyterenv.yml up -d
docker exec -u 0 -it pysparkjupyter_container service ssh start
```
