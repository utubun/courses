---
title: Getting started with bash CLI
description: Introduction to the bash CLI. MOBA Bioinf course
paginate: true
marp: true
marp: false
theme: gia
---

# Getting started with the bash CLI <!--fit-->
MOBA BioInf <!--class:footer-->

---

# What is CLI?

---

## Finding the working directory  <!--fit-->

```bash
pwd
#/home/jholden
```
*Take home message*: 
>`pwd` stands for ***p**ring **w**orking **d**irectory*, and whenever you are lost, `pwd` will tell you where you are.

---

# Changing the working directory

```bash
cd /data/general
pwd 
#/data/general
```
*Take home message*:
>`cd` stands for ***c**hange **d**irectory*. Type the desired path after `cd` command, and it takes you where you want to go

---

# Relative vs absolute paths 

```bash
cd ./projects # it can be just cd projects
cd ../rawdata
```
- You navigate from *your current directory* to the *child* directory, using `./<path>` as a *relative* path;
- You navigate from *your current directory* to the *parent* directory, and from the parent directory, to its *child* direcory using `..` to form a relative path; 

**Take home message**:

> Use `.` to shorthand your *current* directory, and `..` to shorthand the *parent* directory of your current directory. 

---

# Other tricks with cd

- `~` stands for your *home directory* so whenever you are, you can use `cd ~` to run back to your home directory. But typing just `cd` will do the same;
- `-` holds the path to the previously visited directory. `cd -` will take you to the place you visited before.

```bash
cd #<TAB> several times, choose random destinations, repeat
cd .. # <TAB> several more times, choosing random destination
cd -
cd
```

**Take home message**:

> `cd -` will take back you came from. `cd` will always take you home.

---

# Listing the directories 

`ls` stands for **l**i**s**t. The command general format is `ls [OPTION] ... [FILE]...`
By default, `ls` will list the content of your current directory.
## Some useful options
- `-a`, `--all` do not ignore *hidden* files;
- `-l` use a long listing format;
- `-h` human-readable (e.g. show file size in Kb or Mb);
```bash
ls -alh
drwxr-xr-x  3 dst20 moba 4.0K Nov 11 16:03 .local
-rw-r--r--  1 dst20 moba    0 Mar 30 15:20 my_big_long_amazing_file.txt
```
---

## Aditional tricks with `cd`

There are many other options you can use with `ls` command

- `-X` sort alphabetically by entry extension;
- `-t` sort by modification time, newest first;
- `-S` sort by file size, largest first;
- `-R`, `--recursive` list subdirectories recursively;
- `-L`, `--difference` show the information for the file, instead a symbolic link;

---

# Creating a new directory

Use `mkdir` command for creating a new directory (use your current directory by default).

```bash
mkdir playground
```
Options:

- `-m`, `--mode=MODE` set file mode (as in `chmod`);
- `-p`, `--parents` make parent directories as needed, no error if existing;
- `-v`, `--verbose` print message for each created directory;

---

# Creating a new directory. Example of usage

```bash
mkdir temp
```

---

# Removing directories

