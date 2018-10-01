# LFTP Resource

A simple Concourse CI resource to upload files to remote FTP server with lftp.

## Source Configuration

* `url`: URL of the remote server, directory listing must be enabled. Should include credentials if required.

## Behaviour

Push all files from `params.path` to specified FTP server 

```
lftp -c "open $URL; mirror -v -R $SOURCE_DIR/$RELATIVE_DIR . ;"
```


## Example

```
resource_types:
- name: ftp
  type: docker-image
  source:
      repository: elrot/concourse-lftp-resource
      tag: latest

resources:
- name: my-ftp
  type: ftp
  source:
    url: ftp://user:password@download.example.com

jobs:
- name: build
  public: true
  serial: true
  plan:
  
  ...
  
  - put: my-ftp
    params:
      path: my-binaries/
```


