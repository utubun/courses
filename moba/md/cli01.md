---
marp: true
---

# Introduction to Linux CLI <!--style: fit --->
### Dmytro Strunin, MOBA BioInf
---

# What is Linux?

---

# What is GNU
**GNU** is a free software project founded by Richard Stallman in late ... and stands for **G**NU' **N**ot **U**nix.

---

# What is CLI?

**CLI** stands for **C**ommand **L**ine **I**nterface, usually shortened to *command line* or, by historical reasons, into *terminal*. The former dates back to the days when **UNIX** ran on large mainframes accessed via remote terminals.

--- 

# How to access CLI?

If you are working on the system *with* **G**raphical **U**ser **I**nterface (*GUI*) CLI can be accessed through **terminal emulator**, e.g. on **Ubuntu** Linux push `<Ctrl> + <Alt> + T` to open terminal emulator.

Working on the systems *without* GUI, you can interact with it **only** through the CLI, as presumebly you are doing *right now*.

---

# What is Virtual Console?

**V**irtual **c**onsole is a tool allowing you to access the same machine making several alternative connections (dates back to the UNIX times). On most Linux versions you can access up to 7 VCs using <Ctrl> + <Alt> + <Fx> keystroke:

- `<Ctrl> + <Alt> + <F1>` to access first VC;
- `<Ctrl> + <Alt> + <F2>` to access second VC;
- ...
- `<Ctrl> + <Alt> + <F7>` to access seventh VC;

Usually, on systems running GUI, GUI runs on the VC seven by default.

---

# What is shell?

Shell is a program which serves as an interface between you and the **o**perating **s**ystem, and passes instructions from you to your **OS**.

Shell is a programm running in your **terminal emulator** and allows you to issue commands *interactively* or *non-interactively*.

There is no *one* shell, but several programs can be qualified as shells:

- **GUI**;
- **sh** shell;
- **csh** shell;
- **ksh** shell;
- **zsh** shell;
- **c** shell;
- **bash** shell;

---

# History of shell 01

History of shell can be viewed as history of *interface* between human and machine.

1. Wire-plug era (Turing machine);
2. Punch-card era;
3. Command line interpreter or shell;
4. GUI? (See 1-2);

*Kernel* talks to the physical devices such as printers, keyboards, mice, monitor etc. through the variouse drivers;

*shell* as  a command line *command interpreter* receiving the commands from human, translate it to the commands interpretable by *kernel*;

---

# History of shell 02

- **Thompson shell** or simply **sh** the first shell writen for *UNIX* system by *Ken Thompson*. Used for nearly a *decade* before it has been replaced by more advanced shell;
- **Bourne shell** (confusingly it was abbreviated againe as **sh**) was written by *Stephen Bourne*, was more advanced, more feauture-reach comparing to *Thompson shell*;
- **bash** or **Bourne-again shell** replaced the **Bourne shell** after another decade. It was originally released in 1989, went through the long series of updates, upgrades and revisions. Rich of powerfull tools, new features borrowed from other shells;

---

# What is bash?

It is one of the most popular shells in most of the Linux versions, and backs to the days of the UNIX times. It is a abbreviation which stands for **B**ourne-**a**gain **sh**ell.

- The **Bourne shell** was the most popular *proprietary* UNIX shell;
- In late 80s, *Brian Fox* wrote an alternative free version of Bourne shell for **GNU Project** and **Free Software Foundation**;
- The **bash** shell is the default shell fro the most UNIX-based operating systems such as Linux and Mac OS X;

---

# What kind of shell do you have? 

To check which kind of shell do you use you can type following into your terminal:

```bash
echo $SHELL
bash --version
```

If your default shell is not **bash** you can change it using this two commands:

```bash
usermod -s /bin/bash <username>
echo "SHELL=/bin/bash exec /bin/bash --login" >> ~/.profile
```

---

# What is prompt?

The **prompt** is what you see after you've been logged into the CLI, it shows you minimal, but important information and *prompts* you for your command

---

# What is command?

The **command** is usually short, single-purpose tool, program which is designed to do a single task, and do it well.

---

# Getting help 01

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

# What is the simplest command?

The simplest command you can try right now is `whoami`.

#### Self-assessment:

- Type in terminal `whoami` and push `<ENTER>`;
- Analyzing output of the command, and using the information from the previous slides, try to figure out what the command does;

---

# Who's here?

You can see who is whorking on the server at the moment by typing... `who` command. By default it will show you the information about the users logged on. 

---

# I am bored. Is there any fun commands?

Sure, it is. Try the 'Hello, world!' example with `echo` command - classic never gets old, right?

The `echo` command is simply *echoing* whatever you give it as an argument. There are only three possible optional arguments (excluding `--help` and `--version`), so you'll never get lost!

```bash
echo Hello, world!
```
#### Self-assesment

Play with `echo` and print into console whatever you want.

---

# More fun: brackets expansion

Well, it's not fun, lets try something for real. There is a fun feature provided by bash, called *brackets expansion*. Type these commands in your console, and try to figure out what the bracket expansion does.

```bash
echo {1..10}       # print all whole numbers from 1 to 10      
echo {a..z}        # print all letters from a to z
echo {a..c}{1..3}  # print all binary combination of letter and number
```
#### Self assesment

Why the arguments of this command `echo {1..10..2}` looks odd? What does it do? Why?

---

# I don't want to type it again and again, what should I do?

Use <UP> and <DOWN> arrows to brows through your *history*. Linux usually saves up to **2000** of your last commands in an *invisible* `.history` file. Or just type `history` in prompt, to see the whole story.

---

# What are those invisible files?

These files are *hidden* or *invisible*, since their names starts from the period character. It does not protect these files from deletion or modification thought. The most important for as right now are `~/.bash_history` where your history is saved, and `~/.profile` file, where your individual settings are stored, including the prompt configuration itself.

---

# What if I want to know more about the content of file?

Do `more`! This command is designed to help you to read and see the content of the system files:

```bash
more .bash_history
```

It will page for you the content of the file. To brows the next chunk of the text press <SPACE> or <ENTER>. Press <Q> to quite from `more`.

--- 

# Is there more commands for reading the files?

`less`! Because *less is more*! You can use use `less` command for the same purpose, but it allows you to brows through the file forward as well as backwards:

```bash
less .bash_history
```

---

# I am up for a walk. Where could I go?

Anywhere, it's up to you. But remember that there are two type of paths:

- **absolute** which are whole paths from the root up to your target file or directory;
- **relative** which are paths *from your current directory* only!

---

# I can't feel my legs!

Take some `cd` it will make you fly!

---

# Whitespaces horror

Assume you have four files under your directory `~/whitespaces`: `data`, `analysis`, `summary` and a file combining previouse two `data analysis summary`. Assume now, you want to remove the forth file, because you either need your `data` your `analysis` or the `summary` of your analyses, but not the file combining all three of them. What you are intended to do is to use `rm` command (stands for **r**e**m**ove) as follows:

```bash
rm data analysis summary
```
This will work, but results might be not what you are expecting. The command removes first three files, leaving the last file untouched. The better option would be:

```bash
rm 'data analysis summary'
```
And even better option, is to never ever use anything except alphanumeric characters, digits, dash and underscore characters for the names of your files.

---

# Files and directories structure

In Linux -- everything is a file. Not only your data files, but variouse hardvare devices represented as files in the Linux **f**ile **s**ystem.

You can use a command `ls` to explore any directory *you can access*. The command accespts a *path* as it's argument (and youse your *current working directory* as default if you not specifying it) and a tones of *optional* arguments or *switches*. 

```bash
ls       # default representation
ls -lha  # long representation, human-readable, all files
ls -lhaR # the same as above, but recurcively go through each dir & subdir
```

If you rather interested in the *structure* of your directory, but not the details of the files use `tree`:

```bash
tree -L 3
```

---

# Print working directory

`pwd` stands for **p**rint **w**orking **d**irectory. When you enter this command bash will print your *current directory*.

```bash
pwd
/home/jholden/
```
---

# Change directory

`cd` commands stands for **c**hange **d**irectory. It will allow you to move from your *current directory* to any othe directory you want to arive, if you provide it with a *path* to that directory.

There is couple of **tricks**:

- `~` is a short-hand for your *home directory* so `cd ~` or just `cd` will always take you home;
- `-` refers to the variable storing the path to your *previous working directory* (an environmental variable `$OLDPWD`, you can print its content by `echo $OLDPWD`). So if you change your directory, and decided to return back to your previouse directory, just type `cd -`;

---

# Creating new directory

`mkdir` stands for **m**a**k**e **dir**ectory. You must provide the command with the path to the directory you want to create. If you provide just a name of the directory, `mkdir` assumes you mean it to be created in your *current directory*.

Usefull options:
- `-m`, `--mode=MODE` set file mode;
- `-p`, `--parents` make parent directories as needed;
- `-v`, `--verbose` print a message for each created directory.

Example: 

```bash
mkdir project                                       # creates directory project
mkdir ./project/data/{in,out}/{csv,tsv,rmd,bin}     # fails, ./project/data doesn't exist
mkdir -pv ./project/data/{in,out}/{csv,tsv,rmd,bin} # no errors
tree ./project
```
---

# Removing directory

`rmdir` stans for **r**e**m**ove **dir**ectory. The command removes directory if *it is empty* of any files or subdirectories. You can instruct the command to delete non-empty directories with the `-p` or `---parents` switch. The same as with `mkdir` you can use `rmdir` providing it with the *absolute* or *relative* path to the directory you want to remove.

```bash
mkdir ~/project/data/in/raw{csv,tsv,rmd,bin} # you've added dirs but you don't need em
rmdir ~/project/data/in/raw                  # will produce an error since in directory is not empty
rmdir ~/project/data/in/raw/tsv              # will happyly remove your tsv directory
rmdir -p ~/project/data/in/raw               # remove all at onece with -p switch
```

---

# List the contents of directories

`ls` stands for **l**i**s**t files, and the command serves to show the content of the directory (by default - your current directory).

`ls` available with many usefull switches, most useful for you are:

- `-l` which forthes `ls` to show content in a **l**ong format, providing you with the detailed information about files / directories permissions, ownership, size, modification time;
- `-a` which forthes `ls` to show **a**ll files, including hidden files;
- `-h` which instructs `ls` to present information in **h**uman-readable form, i.e. showing the file sizes in Kb, Mb, Gb instead of bites;

```bash
ls -ahl
```
--- 

# Esse ut veritatis et voluptatem et praesentium

There is a fun program called `lorem` which generates for you random *pseudo-latin* text. You can specify how many words (`-w`), sentences (`-s`) or paragraphs (`-p`) you want it to make up for you

```bash
lorem -w 10  # generate 10 latin-looking words
lorem -s 10  # generate 10 latin-looking sentences
lorem -p 10  # generate 10 latin-looking paragraphs
```
Listen what `cowsays`!

---

# Pipes and redirections

You need pipes (`|`if you want to take an output from one command and redirect it as an input for the second command for processing.

You use **redirection** (`>` or `>>`) to redirect the output form your **S**tan**D**ard **OUT**put device (usually your screen, but can be your matrix printer, mhuhaha!) to a different "device" lets say a *text file*.

```bash
lorem -s 10 | cowsay -p > cowsay.txt  # will redirect output from lorem to cowsays and write it
                                      # to the file cowsays.txt
lorem -s 10 | cowsay -p > cowsay.txt  # will do the same, replacing the content of the cowsay.txt
lorem -s 10 | cowsay -d >> cowsay.txt # everything as above, but will append the text to cowsay.txt
ls -lha | grep cow.
```

Remember `>` will redirect and overwrite, `>>` will redirect and append.

---

# Copying files

`cp` stands for **c**o**p**y, and is designed for copying files and directories. It accepts the path to the file you want to copy, the destination path, and several optional arguments. For example `-R`, `-r`, or `--recursive` allows you to copy the content of your *source* directory *recursively*. Specifying switch `-t` before your *destination* path will instruct `cp` to copy all *source* files / directories into the *destination directory*.

Now we want to copy our *cowsay* files into the `./data/in/tsv` directory:

```bash
cp cowsay* -t ./data/in/tsv
```
---

# Moving and renaming files




---