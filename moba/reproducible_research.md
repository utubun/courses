Bioinformatics data skills: reproducible and robust research with open source tools by Vince Buffalo. Reader notes.
===


# Managing a bioinformatics project

The project directory structure must be consistent and understandable.

Advantages:

- Easy comunication of the project;
- Easy automatization of tasks with standard file- and directory names;
- Structure of the project directory, at some degree dictates you the structure of your analysis, teach you to learn valuable data skills;
- Documentation;
- Reproducibility;

## Sample project directory structures

From [Noble, 2009](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)

![Noble, 2009](https://journals.plos.org/ploscompbiol/article/figure/image?size=large&id=10.1371/journal.pcbi.1000424.g001)

My opinion, with some modifications - it is more preferable, comparing to what author of the book propose.

The project structure proposet in the book:

```
project
├── analysis
├── data
│   └── seqs
└── scripts
```
1. `data` contains all *raw* and *intermediate* data (opinion: I wouldn't mix *read only* raw data, and data that can be *modified* during the analysis. It is better to have `./data/raw` and `./data/res<ults>`);
2. All the scripts are storred in the `scripts` directory, divided into *subdirectories* for different languages and / or different modules. (Opinion: it's fine with me, I do the same, except the naming - I use `src` for scripts, because I usually source them to the `main.sh` in the root of the project, when I want to run whole pipeline);
3. `analysis` is a mixed type, it contains high-level analyses, tools output, figures, tables etc (opinion: for me it sounds as a cumbersome);

## Naming the files and directories

### Spaces

Using the spaces in your files or directories names is a bad practice.

As an example, imagine you have following directory structure:

```
sandbox
├── raw
├── raw seq
└── seq
```

At some point you decided to remove `raw seq` directory, and forget to use quotes around the directory name:

```bash
rm -R raw seq
```
After the running this command you'll end up with the following directory structure:

```
.
└── raw seq
```
In other words, `rm` just removed your `raw` and `seq` directories, instead of removing `raw seq`!

### File extensions

Unix *does not require* the file extensions. But, naming the files with the file extensions, gives you and additional information about the *file type*, and considred as a good practice.

```
sandbox
├── anl
├── data
│   └── seq
│       ├── CH8214.bam  
│       ├── CH8214.fasta
│       └── CH8214.sam  
└── src
```

### Referring the scipts and data

Use *relative* instead of *absolute* paths: untill your project structure does not change, all the relative paths will work. But if you use *absolute* paths and you move your project to another location, it will brake down. So in a nutshell absolute paths decrease *portability* and *reproducibility*.

### Documenting the project

>Document everything extensively [!]

- Full description of the code including commands, functions, arguments (save it in the scripts instead of working interactively). Document default values - the latter verisons of the program might use different default values;
- Document the origin of all data in your project directory:
  - From where data was downloaded / obtained from;
  - Who provided you with data;
  - The time you obtained the data (if there is a new version of the dataset - some chritical changes might be introduced, which potentially can change your output drastically);
  - Major and minor version numbers of your data (e.g. data downloaded online);
  - Describe how you downloaded the data (Did you use script? Where the script can be found? Did you use UCSC Genome Browser?);
  - Other relevant information;
- Your data are not only the data obtained from the experiments or your colaborators. Data are any information influencing the output. Gene annotations, reference genomes etc - are also **data**;
- Document the version of the software that you ran. If the version number is not available use *release date*, *link to the software*, and *date you downloaded the software* must be recorded. You can keep track of the changes with the separate `version.log` file;

For the project documentation, create a `README.md` file. This file, at least, should contain the all the information above.

You can create a README files in the subdirectories. For example the file `./data/README.md` could contain the metadata for your data.

## Data organization and Automating the file processing tasks

>Organizing data into subdirectories and using clear and consistent file naming schemes is imperative - both of these practices allow us to programmaically refer to files.

## Brackets expansion

*Brackets expansion* is the case of general *shell expansion*. The example of shell expansion is a conversion of `~` character in e.g. `cd ~` command into the full path to your home directory. 

We can create the a similar directory structure as above with one command, using brackets expansion:

```bash
mkdir -p ./sandbox/{data/seq/{fasta,bam,sam},src/{sh,r},anl}
```
Which results in following directory structure:

```
sandbox
├── anl
├── data
│   └── seq
│       ├── bam
│       ├── fasta
│       └── sam
└── src
    ├── r
    └── sh
```


## Other sources

1. [A quick Guide to Organizing Computational Biology Projects, Noble 2009](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)