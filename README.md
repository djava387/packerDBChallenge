# PACKER-> AWS CHALLENGE

Create a Packer file that creates an AMI that is provisioned for MongoDB. Run mongosh on your machine to show the configuration with Packer has been successful.

## Demo

<<<<<<< HEAD
![](packer-aws.gif)
=======
![](aws-packer.gif)
>>>>>>> 06a86cdd7e0739e794db14634841e4cf1805a1ae

## Notes

### Added variables: builders and provisioners

```
"provisioners": [
    {
      "type": "file",
      "source": "env",
      "destination": "/home/ubuntu/env"
    },
    {
      "type": "shell",
      "script": "./env/mongodb/script.sh"
    }
  ]
```

<<<<<<< HEAD
=======
### Added mongod.service

```
[Unit]
Description=Start mongodb

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu
ExecStart=/usr/bin/mongod --config /etc/mongod.conf
Restart=always

[Install]
WantedBy=multi-user.target
```

>>>>>>> 06a86cdd7e0739e794db14634841e4cf1805a1ae
### Fixed installation error for MongoDB. Changed list file to:

```
deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
~~~
```
