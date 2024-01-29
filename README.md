# Getting sbom from a Docker image using cdxgen 


## Creating a base image to run the scenario
```bash
docker build -t runtime -f runtime/Dockerfile .

docker run --privileged -it runtime bin/bash
```

## Start docker
```bash
service cgroupfs-mount start
service docker start

cd hello-java21
```

## Create Docker image using a Dockerfile
```bash
./gradlew assemble
docker build -t app-21 -f Dockerfile .
```
```bash
cdxgen app-21:latest -o docker-bom.json -t docker
```
```text
root@5fe85f03d91d:/hello-java21## cdxgen app-21:latest -o docker-bom.json -t docker
Error while extracting image /tmp/docker-images-8ogAaL/41da1d066941ce0d755ea3fb38a91100b0ea8e0ef12d679f82f70abd9fc48fd1/layer.tar to /tmp/docker-images-8ogAaL/all-layers. Please file this bug to the cdxgen repo. https://github.com/CycloneDX/cdxgen/issues
------------
Error: TAR_ENTRY_UNSUPPORTED: unsupported entry type: FIFO
    at UnpackSync.warn (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/warn-mixin.js:21:40)
    at UnpackSync.warn (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/unpack.js:229:18)
    at [unsupported] (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/unpack.js:518:10)
    at [onEntry] (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/unpack.js:347:33)
    at UnpackSync.<anonymous> (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/unpack.js:219:44)
    at UnpackSync.emit (node:events:514:28)
    at UnpackSync.emit (node:domain:489:12)
    at [processEntry] (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/parse.js:248:12)
    at [nextEntry] (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/parse.js:259:36)
    at [consumeHeader] (/tmp/caxa/applications/cdxgen/iahfz5li5i/0/node_modules/tar/lib/parse.js:223:32) {
  entry: ReadEntry {
    _events: [Object: null prototype] {},
    _eventsCount: 0,
    _maxListeners: undefined,
    writable: false,
    readable: false,
    extended: null,
    globalExtended: null,
    header: Header {
      cksumValid: true,
      needPax: false,
      nullBlock: false,
      block: null,
      path: 'dev/initctl',
      mode: 4480,
      uid: 0,
      gid: 0,
      size: 0,
      mtime: 2023-09-21T02:08:09.000Z,
      cksum: 4864,
      linkpath: '',
      uname: '',
      gname: '',
      devmaj: 0,
      devmin: 0,
      atime: null,
      ctime: null,
      [Symbol(type)]: '6'
    },
    startBlockSize: 0,
    blockRemain: 0,
    remain: 0,
    type: 'FIFO',
    meta: false,
    ignore: false,
    path: 'dev/initctl',
    mode: 384,
    uid: 0,
    gid: 0,
    uname: '',
    gname: '',
    size: 0,
    mtime: 2023-09-21T02:08:09.000Z,
    atime: null,
    ctime: null,
    linkpath: '',
    absolute: '/tmp/docker-images-8ogAaL/all-layers/dev/initctl',
    unsupported: true,
    [Symbol(kCapture)]: false,
    [Symbol(flowing)]: true,
    [Symbol(paused)]: false,
    [Symbol(pipes)]: [],
    [Symbol(buffer)]: [],
    [Symbol(objectMode)]: false,
    [Symbol(encoding)]: null,
    [Symbol(async)]: false,
    [Symbol(decoder)]: null,
    [Symbol(EOF)]: true,
    [Symbol(emittedEnd)]: true,
    [Symbol(emittingEnd)]: false,
    [Symbol(closed)]: false,
    [Symbol(emittedError)]: null,
    [Symbol(bufferLength)]: 0,
    [Symbol(destroyed)]: false,
    [Symbol(signal)]: undefined,
    [Symbol(aborted)]: false
  },
  cwd: '/tmp/docker-images-8ogAaL/all-layers',
  code: 'TAR_ENTRY_UNSUPPORTED',
  tarCode: 'TAR_ENTRY_UNSUPPORTED'
}
```

## Create Docker image using Buildpacks
```bash
./gradlew bootBuildImage

cdxgen hello-java21:0.0.1-SNAPSHOT -o pack-docker-bom.json -t docker
```

