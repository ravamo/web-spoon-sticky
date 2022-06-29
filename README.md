# Build a Dockerfile
```sh
$ docker build -t webspoon -f Dockerfile .
```
Dependences spoon-git and database driver 
Basice usage
```sh
$ docker run -d -p 8181:8080 sowe/webspoon:1.0
```

# Run webSpoon on Kubernetes
[![lastest-release](https://badgen.net/badge/Fork/webspoon-docker/red?icon=git)][fork]

- Clone this repository.
- Copy `config/security.xml.bak` to `config/security.xml` and edit users/passwords.
- Create a namsespace webspoon.
- Run the following command to create required resources.

```sh
$ ./create_all.sh
```

Check that webspoon is running.

```sh
$ kubectl get pods
NAME                        READY   STATUS              RESTARTS   AGE
webspoon-78767c7f57-b9fzd   1/1     Running             0          5m7s
```

If ingress is not installed do port forwarding of `8080` port of the service to local machine.

```sh
$ kubectl port-forward service/webspoon 8080:8080 &
```

While port forwarding, access to the port of local machine.

```
http://localhost:8080
```

## Shared `~/.kettle` and `~/.pentaho` directory

Pods share `~/.kettle` and `~/.pentaho` directory as PersistentVolumeClaim (PVC).
If you want to deploy this PVC to a Kubernetes cluster which only supports `ReadWriteOnce`, you can configure YAML files.

Edit `pvc.yaml`.

```yaml
  # - ReadWriteMany # Comment out
  - ReadWriteOnce # Uncomment
```

## Customize

File locations by default

| File | Mount target in webSpoon pod |
|-|-|
| `web.xml` | `/usr/local/tomcat/webapps/spoon/WEB-INF/web.xml` |
| `catalina.policy` | `/usr/local/tomcat/conf/catalina.policy` |
| `security.xml` | `/usr/local/tomcat/webapps/spoon/WEB-INF/spring/security.xml`|

## Tear down

```sh
$ ./delete_all.sh
```
