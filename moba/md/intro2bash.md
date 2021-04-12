---
marp: true
---

# Trying some simple comands

```bash
# This is a comment, when typed the whole string is ignorred by your CLI
whoami         # shows your username
who            # refers back to Thompson shell, shows who is logged in
echo $BASH     # prints the path for your shell executable
bash --version # shows the detailed information about your bash version
```
---

# Echo and a brackets expansion

`echo` is simply *echoing* everything you type into it:

```bash
echo Hello, world!
echo echo
```

You can get more fun with the *brackets* expansion. Simply speaking, everyargument listed within `{}` will be evaluated separately:

```bash
echo file_{a,b,c}.txt 
echo {a..h}{1..12}
```

---

# Print working directory

There are moments when you want to know where (in which directory) you are.

`pwd` stands for **p**rint **w**orking **d**irectory. When you enter this command bash will print your *current or working directory*.

```bash
pwd
# /home/jholden/
```

Compare it to your prompt, you are probably seeing `~` symbol instead of the path to your home directory. By conviniece, in Linux CLI `~` means your home directory. You can see how we can use it latter.

---

# Move between directories

`cd` commands stands for **c**hange **d**irectory. With `cd` you can move from your *current directory* to any directory you want, if you provide a *path* to that directory. There is couple of **tricks**:

- `~` is a short-hand for your *home directory* so `cd ~` or just `cd` will always take you home;
- `-` refers to the variable storing the path to your *previous working directory*. So if you change your directory, and decided to return back to your previouse directory, just type `cd -`;

```bash
cd /data3 # change your working directory to data3, validate it with pwd
cd ~      # return to your home directory, validate it with pwd
cd -      # return back to data3 directory, validate it with pwd
cd        # return home againe, validate it with pwd
```
---

# List files and directories

Now, when you are at your *home directory* you can use a command `ls` to explore the directory content. The command accespts a *path* as it's argument (your *current working directory* as default if not specified) and a tones of *optional* arguments or *switches*. 

```bash
ls       # default representation
ls -l    # long format representation
ls -lha  # long representation, human-readable, all files
ls -lhaR # the same as above, but recurcively go through each dir & subdir
```
---

# Tree

You can use `tree` command instead of `ls` when you would like to see the *structure* of your directory. The command accepts a path to your directory, and several *optional arguments*. We will use `tree` with `-L` switche to display the max display depth **l**evel for directories equal to 2.
```bash
tree -L 2
```

---

# Making directories

Now, when we are in our working directory we are going to create a new project we call *sandbox*. 

We can do it with `mkdir` command (stands for **m**a**k**e **dir**ectory). It accepts the *path* to the directory you are going to create, and several optional arguments.

``bash
mkdir 
```
---