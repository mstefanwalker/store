# store
store files on a server and keep them in sync!

handy for things where version control isn't needed, but you would like a backup of files just in case

## setup

1) set up a server running ubuntu to be used as a backup and prefereably put a domain name on it.
2) look in the `ansible` directory and replace any example files with your config and credentials
3) from the `ansible` directory run `./install-ansible.sh`
4) in the same directory, then run `ansible-playbook install-store.yml`

You are all set to start syncing you files!

## sync your files

place them in the `store` folder and sync them by running this command in the project root:

```
./resync
```
