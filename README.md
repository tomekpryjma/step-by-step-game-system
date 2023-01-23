## To run:

```
./setup.sh
```

## To setup Xdebug for VSCode

Ensure your `launch.json` has these values:

```
...
"configurations": [
    {
        "name": "Listen for Xdebug",
        "type": "php",
        "request": "launch",
        "port": 9000,
        "pathMappings": {
            "/var/www/html": "${workspaceFolder}/src"
        },
        "hostname": "0.0.0.0",
    },
    ...
```