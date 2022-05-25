# Create SonarQube Stack
Create Folders on Worker Node
```
mkdir -p /opt/sonarqube/{data,extensions,postgres}
chmod 777 /opt/sonarqube/
```

## Create Posgres DB and user
```
CREATE ROLE sonaradmin;
ALTER ROLE sonaradmin WITH PASSWORD 'password123';
ALTER ROLE sonaradmin WITH SUPERUSER;
ALTER ROLE sonaradmin WITH LOGIN;
CREATE DATABASE sonar_db;
GRANT ALL PRIVILEGES ON DATABASE sonar_db TO sonaradmin;
```

## Create Base64 Password
```
echo "password123" | base64
```

## Test
Testing UI
```
http://192.168.1.126:30036/about
http://192.168.1.126:30036/projects
```
