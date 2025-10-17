# Store
Store a copy of local files on a server and keep them in sync!

This is handy for things where version control isn't needed, but you would like a backup of files just in case.

## Setup

### Server(s)

Identify on or more ubuntu servers you manage to act as the stores.

As a quality of life improvement, it can be nice if these have domain names pointed at them, but his is not required.

### Config

Navigate to the `ansible` directory.

In this directory, place the public key of your machine. This will be added to the `authorized_keys` of a new `store` user on each of the store servers so that you can sync to each store.

Your public key file will look something like `id_ed25519.pub` or `id_rsa.pub`

Now, create a file called `inventory.ini` to record each of the servers you identified above.

The file's contents should look like this, with text in `<placeholders>` replaced with your conifg.

```ini
; inventory.ini
[stores]
<store server name, arbitrary> ansible_host=<domain name or ip address> store_path=<folder on server>
<a second server name> ansible_host...

[stores:vars]
username=<username of the store user to create on all servers>
password=<password for the store user, keys will be used for ssh login>
```

### Locally Install Ansible

If you don't have ansible and rsync already installed on your machine, install those now.

`./install-ansible.sh` provides convenience if you'd like. Take a look at this script before you run it so that you know how the dependencies are installed and you can decide if you'd prefer a different method.

### Install the Stores

Now for installing the store on each store server identified in your `inventory.ini`.

This will create a user on each store server as specified in the `inventory.ini`, and for each server a folder at the specified path for holding the synced files.

From the `ansible` directory, run `ansible-playbook install-store.yml`.

## Sync Your Files

Place them in the `store` folder and sync them by running this command in the project root:

```
./resync
```
