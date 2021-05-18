# Load libraries

suppressPackageStartupMessages(
    library(tidyverse)
    )

# Print comforting message

message('Plotting the data...')

# Read and transform data

dat <- read.csv('./data/out/csv/gene_count.csv', header = FALSE)

colnames(dat) <- c('LysR Copy Number', 'HTH Copy Number')

# Make a plot

g <- ggplot(dat, aes(x = `LysR Copy Number`, y = `HTH Copy Number`)) +
    geom_line(col = 'red') +
    geom_point(pch = 19, size = 3,   colour = 'red') +
    geom_point(pch = 19, size = 2.4, colour = 'white') +
    labs(
        title    = 'Counting with grep', 
        subtitle = 'MOBA BioInf: Intro to Linux CLI',
        caption  = 'Data source: https://ftp.ncbi.nlm.nih.gov/'
        )  +
    ggthemes::theme_tufte()

# Save plots in different formats

suppressMessages(
    ggsave(filename = './data/out/img/png/gene_count.png', plot = g, device = 'png')
)
suppressMessages(
    ggsave(filename = './data/out/img/pdf/gene_count.pdf', plot = g, device = 'pdf')
)
suppressMessages(
    ggsave(filename = './data/out/img/svg/gene_count.svg', plot = g, device = 'svg')
)

# Goodbye message

message('Done!')