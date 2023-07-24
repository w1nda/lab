sudo docker cp container-id:/path/filename.txt ~/Desktop/filename.txt

# know_hosts fail when try ssh by vscode
Just clean the known_hosts of the container.
```
[22:09:54.547] Running script with connection command: "C:\Windows\System32\OpenSSH\ssh.exe" -T -D 55720 "debian_env" bash
[22:09:54.550] Terminal shell path: C:\WINDOWS\System32\cmd.exe
[22:09:54.854] > @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
> @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
> @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
> IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
> Someone could be eavesdropping on you right now (man-in-the-middle attack)!
> It is also possible that a host key has just been changed.
> The fingerprint for the ED25519 key sent by the remote host is
> SHA256:rpPedRQDeBD1VaaTpCFyujCc56AI09yoKGdlxPi+0Pc.
> Please contact your system administrator.
> Add correct host key in C:\\Users\\truewind/.ssh/known_hosts to get rid of this message.
> Offending ED25519 key in C:\\Users\\truewind/.ssh/known_hosts:16
> Host key for [127.0.0.1]:10312 has changed and you have requested strict checking.
> Host key verification failed.
```

# connect github with SSH key
1. generate SSH key in container: ssh-keygen
2. add the public key in github
3. add git **SSH** remote in container repo
