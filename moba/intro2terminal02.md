---
marp: true
---

# Introduction to Linux CLI <!--style: fit --->
### Dmytro Strunin, MOBA BioInf

---

# Downloading files

For downloading remote files we can use either `curl` or `wget` commands. In this particular example we will use `wget`. The first for the `wget` is the path to the remote file, which in our case is located in NCBI FTP server. The second argument (`-P`) specifies the directory we want to download our file to.

```bash
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/455/555/GCF_900455555.1_44927_G02/GCF_900455555.1_44927_G02_genomic.gff.gz -P ./data/txt/gbff
```
Checking the structure of our directory we can see that file has been succesfully downloaded into the `./data/txt/gbff/` directory:

```bash
ls -ahl ./data/txt/gbff/
# -rw-rw-r-- 1 ubot ubot 402K Aug 31  2020 GCF_900455555.1_44927_G02_genomic.gff.gz
```

---

# Listing the files in archive

Looking to the output of `ls` command, we can see that the downloaded file is in fact an *archive* which have been created using `gunzip` programm as we can guess from `.gz` extension. We have no idea if the archive is composed from a single compressed file, or are there several files, or we deal with the more complex directory structure of an archive.

To list the files in the archive we can use `gunzip` itself with the `-l` option which stands for `list files`:

```bash
gunzip -l ./data/txt/gbff/GCF_900455555.1_44927_G02_genomic.gff.gz 
#          compressed        uncompressed  ratio uncompressed_name
#             411395             3293647  87.5% ./data/txt/gbff/GCF_900455555.1_44927_G02_genomic.gff
```

---
