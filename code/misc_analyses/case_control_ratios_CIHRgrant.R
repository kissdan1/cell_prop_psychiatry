rosmap_meta = read_csv("/external/rprshnas01/external_data/rosmap/gene_expression/RNAseq_Harmonization/Gene Expression (Raw Gene Counts)/Metadata/RNAseq_Harmonization_ROSMAP_combined_metadata.csv")
msbb_meta = read_csv("/external/rprshnas01/external_data/rosmap/gene_expression/RNAseq_Harmonization/Gene Expression (Raw Gene Counts)/Metadata/RNAseq_Harmonization_MSBB_combined_metadata.csv")
mayo_meta = read_csv("/external/rprshnas01/external_data/rosmap/gene_expression/RNAseq_Harmonization/Gene Expression (Raw Gene Counts)/Metadata/RNAseq_Harmonization_Mayo_combined_metadata.csv")


# Create a new column 'diagnosis' with default value 'control'
rosmap_meta$diagnosis = 'control'
msbb_meta$diagnosis = "control"
# Update the 'diagnosis' column based on the specified conditions
rosmap_meta$diagnosis[rosmap_meta$braaksc >= 4 & rosmap_meta$ceradsc >= 2 & rosmap_meta$cogdx %in% c(2:6) & is.na(rosmap_meta$exclude)] <- 'Alzheimer Disease'
msbb_meta$diagnosis[msbb_meta$Braak >= 4 & msbb_meta$CDR >= 1 & msbb_meta$CERAD <= 2 & !msbb_meta$exclude] <- 'Alzheimer Disease'

mayo_meta %>% group_by(diagnosis) %>% tally()
rosmap_meta %>% group_by(diagnosis) %>% tally()
msbb_meta %>% group_by(diagnosis) %>% tally()


