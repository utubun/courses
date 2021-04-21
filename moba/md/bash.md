Basic bash usage
===

# User groups

List all the groups, if executed with username(s) lists all the groups user belongs to. The only options for this command are `--help` and `--version`:

```bash
groups # lists all the groups
groups dst20 mpr09 # Lists groups for both users separately
```
# Efficiency

## <Tab> completion

### Commands

Start typing the command and push `<Tab>`. If there is only one command or file name,
command / file name will be auto-completed. Pressing `<Tab>` two times will print
the list of commands starting from the typed in string, and will return you to the
cli.

Using two `<TAB>`s:

```bash
host             # Push <TAB> two times
# host         hostid       hostname     hostnamectl
```
Using `<TAB>` & `<ENTER>`:

```bash
hostn            # Push <TAB> and <ENTER>
# hzi-bsmoba
ypd              # Push <TAB> and <ENTER>
# ypdomainname: Local domain name not set
```
### Files and directories

If you have files having the same prefix in the directory, typing the prefix followed by `<TAB>` will expand the filename to the common prefix.

Typing `<TAB>` three times will print all the files with the common prefix:

```bash
cat f          # Type <TAB> three times
# file1.txt file2.txt file3.txt file4.txt file5.txt
cat f
```

Adding the specific character after that and pressing the `<TAB>` again will expand the whole file name if found.

```bash
cat f          # Type the common prefix for files file1.txt ... file5.txt
cat file       # Press <TAB>
cat file1      # Type the next character, specific for particular file
cat file1.txt  # Press <TAB> to expand the name of the file to file1.txt
```
For the directories it works the same as above:

```bash
ls -d D        # Press <TAB> two times
# Desktop Documents Downloads
cd D           # Press <TAB> two times
# /Desktop /Documents /Downloads
cd De          # Press <TAB><ENTER>
cd Desktop/
pwd
# /home/jason/Desktop
```
### bash programmable completion

> Programmable completion is a feature of the bash shell that allows command arguments to be autocompleted

To enable  programmable completion on an Ubuntu system  source `/usr/share/bash-completion/bash_completion`, and uncomment the appropriate lines in `/etc/bash.bashrc`

```bash
./usr/share/bash-completion/bash_completion
man sub       # Push <TAB><TAB>
# subgid        subpage_prot  subs          subuid
man subd      # Push <TAB>
man subdomain.conf
git pu        # Push <TAB>
# pull push
```

# Navigating file system

## Change directory

Command `cd` is used for the changing from your current to the new directory.

### Arguments

#### Required

`DIR` is a target directory. By default it is user's home directory. As they say:

> `cd` will always bring you home!

```bash
cd /data3/mobadb
pwd
# /data3/mobadb
cd
pwd
# /home/dst20
```
#### Optional

- `-L` force symbolic links to be followed, resolving to the physical directory (default);
- `-P` ignore symbolic links and use physical dir structure instead;
- `e` if `-P` is specified and current working directory can't be determined successfully exit without error;
- `@` file specifying the directory attributes

### Tricks

- `cd ~` or just `cd` brings you to your home directory;
- `cd -` brings you to the previous directory;


# Reuse

## Last item from the previous command

The last item is stored in variable `!$`, and you can use it to reuse the item:

```bash
ls dev
cd !$
```

## Last command that starts from ...

To reuse the command which starts with some prefix, type `!` followed by this prefix (specify as much letters as you need) and hit `<ENTER>`:

```bash
df -h
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/sda3       853G  234G  577G  29% /home
# do some work of copying or removing files
!d # <ENTER>
df -h
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/sda3       853G  235G  576G  29% /home
```
## Command substitution

You can use output of one command as an input for another command. There are two ways of doing that:

- surrounding a command with backticks (old school);
- using `$(command ...)`

```bash
lorem -p 100 > logfile_$(date +%F).txt
less logfile_2021-03-30.txt
rm !$
```
### Using for loops with command substitution

Go trough the commands latter

```bash
for USER in mike jason chris
do
  sudo passwd -l $USER
  logger -t compromised-user $USER
done

sudo tail -3 /var/log/syslog
```
Using with command substitution

```bash
for x in $(cut -d: -f1 /etc/passwd)
do
  groups $x
done
```
## Repeat the previous command with root privilages

Use `!!` if `sudo` is configured or `su -c "!!"` if not.

Killing a process that is running as another user:

#### sudo

```bash
ps -e | grep nginx
pkill nginx         # permission denied
sudo !!
!ps
```
#### su

```bash
useradd trevor      # permission denied
su -c "!!"
id trevor
```

## Repeat the previous command substituting a string

You can use `^orginal_string^new_string^` pattern:

```bash
ps -ef | grep nginx | awk '{print $2}'
^nginx^apache^
```
By default only one occurrence of the word replaced. To replace all of them, append `:&`:

```bash
grep canon /etc/passwd ; ls -ld /home/canon # No such file or directory
^canon^cannon^:&
```
If the second string is not provided, first will be removed from the command:

```bash
cat errors.log
^s^             # first 's' is substituted by ''
```

Trailing carret symbol can be omitted except when using `:&`:

```bash
grpe jason /ect/passwd  # misspelled 'grep'
^pe^ep
```
## Reuse a word on the same command line

For reusing the word in the same command line, use `#!` which represents the command line itself, coupled with `:N` where `N` is zero-based position of the word (e.g. command is almost always is 0, 1 is the first argument etc):

```bash
sudo cp usb_modeswitch.conf !#:2.back
mv report.txt $(date +%F)-!#:1
```

# Aliases

Save your time by aliasing repeated commands. Aliases will be lost after logging out. To save them to one of the "dot files" usually `~/.bash_profile`.

## Examples

```bash
alias ct='column -t'    # format text into a table
alias d='date _%F'      # date in %Y-%m-%d format
alias dfc='df -hPT | column -t' # Easy to read df output
alias ll='ls -l'        # long listing format for ls
alias ls='ls --color=auto' # colorize ls
alias grep='grep --color=auto' # colorize grep
alias tree='tree -C'    # colorize tree
alias utc='TZ=UTC date' # time in UTC
```


# Useful to know

## Who am I?

Command `whoami` returns you your username:

```bash
whoami
# dst20
```
Command `whoami` uses command `id` under the hood. This command is more complicated,
and has a bunch available options:

```bash
# id [OPTIONS] ... [USER]
```

## Cloud hostings

- [Digital Ocean](https://www.digitalocean.com/?refcode=1a3311232666) is a simple cloud hosting for developers. SSD cloud server in 55 seconds. $5 month. SSH and Shell access;
- [Bluehost](https://www.bluehost.com/) website hosting;
