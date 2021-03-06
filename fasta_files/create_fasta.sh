#!/bin/bash

# create some fasta files without names that students can characterise

wget -N "ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz"

gunzip -kf Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz

sed 1d Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.unwrap.fa \
| paste - - | shuf | head -20 | tr '\t' '\n' | tee sample_named.fa \
| grep -v '>' | nl -n ln | sed 's/^/>/' | tr '\t' '\n' > sample.fa
