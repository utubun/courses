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

If you accidently typed `sl` instead of `ls`: pray to the God and run away.

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

```bash
mkdir sandbox # create a new directory 'sandbox'
ls -alh       # list files and directories in a current directory
cd sandbox    # change directory to 'sandbox'
pwd           # print working directory
```
---

# Few words about managing your project



---

# Structuring our project directory

We can create our project's subderictories one by one, travelling from subdir to subdir... Recall what we've done with `echo` and *brackets expansion*? 

```bash
mkdir -pv src/{sh,r,py} data/{in,out}/{csv,rds,fasta,txt}
tree
```

---

# Removing directories

You can use command `rmdir` (stands for **r**e**m**ove **dir**ectory), which refers back to *Thompson shell* times. You must provide the path to the directory you are going to remove, and command will remove it, if it does not contain files or subdirectories. 

To remove the directory and it's ancestors use `-p` or `--parents` switch. Make the command verbose with `-v` or `--verbose` switch.

Working on your project, you realize that **R** and **shell** are the only tools you need to analyze your data. 

```bash
rmdir ./src/py
tree 
```

---
# Esse ut veritatis et voluptatem et praesentium

There is a fun program called `lorem` which generates for you random *pseudo-latin* text. You can specify how many words (`-w`), sentences (`-s`) or paragraphs (`-p`) you want it to make up for you

```bash
lorem -w 10  # generate 10 latin-looking words
lorem -s 10  # generate 10 latin-looking sentences
lorem -p 10  # generate 10 latin-looking paragraphs
```
Listen what `cowsay`!

---

# Pipes and redirections

You need pipes (`|`if you want to take an output from one command and redirect it as an input for the second command for processing.

You use **redirection** (`>` or `>>`) to redirect the output form your **S**tan**D**ard **OUT**put device (usually your screen, but can be your matrix printer, mhuhaha!) to a different "device" lets say a *text file*.

```bash
lorem -w 10 | cowsay -s                 # will pipe lorem output to cowsay
lorem -p 10 | cowsay -g > cowsay01.txt  # Will do the same & redirect the output to cowsay01.txt
lorem -p 10 | cowsay -p > cowsay01.txt  # will do the same, replacing the content of the cowsay.txt
lorem -p 10 | cowsay -d >> cowsay01.txt # will do the same, appending the text to cowsay.txt
lorem -p 10 | cowsay -b > cowsay02.txt  # will do the same & redirect the output to cowsay02.txt
```

Remember `>` will redirect and overwrite, `>>` will redirect and append.

---

# Reading the files

There is a command `cat` which allows you to read files. Command accept the *path* to the file, and several *optional arguments* (`-n` to number all output lines, `-s` suppress repeated empty lines):

```bash
cat -ns cowsay01.txt
```
`cat` shows all the text at once. Sometimes it is too big to fit the current screen. We can use `more` to navigate the screen (use `<SPACE>`):

```bash
more cowsay01.txt
```
There is one more command (don't listen em saying that 'Less is more!'):

```bash
less cowsay01.txt
```

---

# Copying files

`cp` stands for **c**o**p**y, and is designed for copying files and directories. It accepts the path to the file you want to copy, the destination path, and several optional arguments. For example `-R`, `-r`, or `--recursive` allows you to copy the content of your *source* directory *recursively*. Specifying switch `-t` before your *destination* path will instruct `cp` to copy all *source* files / directories into the *destination directory*.

Since it is bad practice to store the data files in the root of the project, we are going to copy our *cowsay* files into the `./data/in/csv` directory:

```bash
cp cowsay* -t ./data/in/csv
tree
```
In the code above we use *wildcard* (`*`) to copy our *cowsay* files into `./data/in/tsv`. Wildcard `*` stands for *any character repeated zero or more times*. So in our case `cowsay*` will match both `cowsay01.txt` and `cowsay02.txt`.

---

# Removing the files

Since we successfuly copied files into `./data/in/csv` directory we can delete our `cowsay*.txt` files from the root of the project.

We are going to use command `rm` to remove *files* or *directories*. To remove directories containing other files and directories, use `-r` or `-R` switch. The same as with `cp` we can use wildcards with `rm`.

```bash
rm -v cowsay0?.txt
tree
```
Above we use `-v` switch to make `rm` verbose. Notice how we use another *wildcard* `?` wich stands for *any symbol*, so it will remove *cowsay0**1**.txt* and *cowsay0**2**.txt*.

---

# Moving the files

Now we realized that we we copied our files into the wrong directory: the directory is *csv* but our data files are just a simple text files! Let's move them to the right place, `txt` directory.

To move a file (or directory) we use `mv` command. This command accepts path(s) to the files (directories) you are going to move, and destination path(s). It is also accept *optional arguments*, some of them are similar to `cp` and `rm` optionals. 

```bash
mv -v ./data/in/csv/cowsay* -t ./data/in/txt/
tree
```

Notice how we use `-v` switch to make `mv` verbose, `-t` switch to specify *target* directory, and `*` wildcard to copy both `cowsay*.txt` files.

---

# Renaming files

The fact that we can specify the name of our *destination file* allows us not ony *move* but also *rename* files with `mv`. Let's give our files more seriouse, sciefntifically-sounding names:

```bash
mv -v ./data/in/txt/cowsay01.txt ./data/in/txt/dataset01.txt
mv -v ./data/in/txt/cowsay02.txt ./data/in/txt/dataset02.txt
tree
```
Notice that we use `-v` switch to make `mv` verbose.

---

# Letter from Matthias

We are absolutely happy with our project, but suddenly we recieved the letter from our server's admin:

> Dear colleagues,
We are out of storrage againe. Please use datasets prepared for you and stored in `/data3/` directory. In particular, for those who works on the cow voice recognition project - do not copy, and do not store *cowsay* datasets in your home directory!
...
Best,
Matthias

---

# Links

The command `ln` accepts to arguments *a target* and a *link_name*. When called with a `-s` switch it will create a *symbolic link* which points from *link* to *target*. You can use it as a regular file. The only difference - it is small, and if you delete it, it will not affect *target* file.

Targets are our files in `/data3/cvr/` directory, and link names are the same as the dataset names

```bash
ln -sf ~/data3/sandbox/dataset0{1,2}.txt ~/sandbox/data/in/txt
tree
less ./data/in/txt/dataset01.txt
```
Notice how we use `-f` switch (stands for *force*) to *replace* existing files with the links.

---

# Running scripts

The bioinformatics team prepared two useful scripts for you `main.sh` and `main.R`. You can find them in `/data3/sandbox/` directory. 

Of course, knowing how to create a symbolic links, you don't need to copy these files - you just need to link them under your `./src/sh` and `./src/r` directories:

```bash
ln -sf /data3/sandbox/main.sh -t ~/sandbox/src/sh
ln -s /data3/sandbox/main.R  -t ~/sandbox/src/r
tree
```
When you've done, just run the scripts from your shell:

```bash
./src/sh/main.sh
./src/r/main.r
```

---

# Archiving our project

We are done with our project, and we are going to archive it just in case if we would need to revisit it latter. We can use a `zip` comand for this purpose. Command accepts tones of optional arguments, but in our case, we want to *recursively* *move* (`-m`) our project directory into the zip archive:

```bash
cd 
zip -rm sandbox.zip sandbox
ls
```
---

# Clean your workspace

To clean our workspace, we are going to remove our `sandbox` project. We already know that to remove directory we can use `rm` command:

```bash
#cd
rm sandbox.zip
```

---

# What else do I need? Help!

You can use several commands to get help:

- `man` short for **man**ual, displays manual pages for the *argument* after the command;
  - `whatis` displays short, single line description of it's argument. The same can be achieved by `man` with `-f` *switch*;
- `help` displays manual pages for bash *built-ins* and *keywords*;
    - `type` shows you the type of particular command;
- `apropos` searches a man page's short description for the given keyword. The same can be acheived by `man` with `-k` switch allows you to do the same;

---

# Getting help, examples

```bash
# show manual pages for man command
man man
# short single-line description for man command
whatis man
# the same but using man and -f switch
man -f man
# show online documentation for sl command
info sl
# show help pages for [[
help [[
# show type of [[
type [[
# show man-pages entries using whoami keyword
apropos whoami
# do the same with man and -k switch
man -k whoami
```

---

# Thank you

The last trick, seriously. 

Did you know you can use a terminal as a messenger? Yup, those bearded guys from 70s loved to chut as well. 

With `wall` command you can type whatever message you want wrapped with double quotes `"`. 

But hey...we learned **pipes** remember? Let's use our skills to do something fun!

```bash
cowsay "Thank you MOBA!" | wall
```
