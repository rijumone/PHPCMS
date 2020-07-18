---
Title: SSH
Description: You will eventually need to remotely "I'm in".
Date: 10 July 2020
Image: /assets/img/ssh-screen.png
Template: single
---

# SSH

As someone who will need to work with Linux machines and servers eventually, every dev worth their salt needs to know about this indispensable remote connection protocol.

SSH allows you to connect to machines over the internet. That's it really.
It's insanely powerful though, allowing many different kinds of connections made over the SSH protocol. VNC, MySQL and others can connect over SSH apart from their standard authentication mechanisms.

## Command
As simple as:

```bash
ssh {{user}}@{{hostname}}
```

Ah, wait, you say? What if the machine's user is (invariably) secured by a password.
Well then, you will (invariably) be prompted for the password.

"Okay, but I have a private key file that has access to the machine"?
Very well.

```bash
ssh {{user}}@{{hostname}} -i /path/to/keyfile
```

Just ensure that the keyfile has proper permissions. 
```bash
chmod 400 /path/to/keyfile
```