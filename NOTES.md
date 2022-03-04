guix package script

https://github.com/google/benchmark
https://gmplib.org/manual/Factorial-Algorithm
https://www.luschny.de/math/factorial/FastFactorialFunctions.htm
https://stackoverflow.com/questions/5405016/can-i-check-my-programs-output-with-boost-test


VERSION=20220303
docker run -it --mount type=bind,source=/home/ec2-user/.cache/JetBrains/RemoteDev-CL/_efs_devel_factorial/.docker/2022_1/Docker/ghcr_io_greghogan_factorial_${VERSION}/gnu/store,target=/tmp/remotedev ghcr.io/greghogan/factorial:${VERSION} bash
cd /tmp/remotedev
ls | xargs -I{} rsync -av /gnu/store/{}/ {}/

http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p1204r0.html
