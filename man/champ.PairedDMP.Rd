\name{champ.PairedDMP}
\alias{champ.PairedDMP}
\title{
Identify Paired Differential Methylation Positions in Illumina HumanMethylation450 or HumanMethylationEPIC data.
}
\description{
This function would use limma package to calculate paired differential methylation probes between two phenotypes. In this function, pair parameter is required and it should be matched with pheno data. The pair parameter should be a vector, each patient should have two appearances in this vector. It's easy to use but do remember to specify which two phenotypes you want to calculate in compare.group parameter. Note that, if the compare.group parameter is NULL, or the factor in it are not find in pheno, the first two phenotypes would be analysed automatically. Note that the result of champ.PairedDMR() would be used as inpute of champ.GSEA() and champ.PairedDMP() function, thus we suggest user not change the internal structure of the result of champ.PairedDMR() function.
}
\usage{
    champ.PairedDMP(beta = myNorm,
                    pair = NULL,
                    pheno = myLoad$pd$Sample_Group,
                    adjPVal = 0.05,
                    adjust.method = "BH",
                    compare.group = NULL,
                    arraytype = "450K")
}

\arguments{
	\item{beta}{A matrix of values representing the methylation scores for each sample (M or B). Better to be imputed and normalized data. (default = myNorm)}
    \item{pair}{A vector of Pairs information for DataSet, merely it should be like labels for Patients. Each patient's name should appear exactly twice in this vector. (default = NULL)}
	\item{pheno}{This is a categorical vector representing phenotype of factor wish to be analysed, for example "Cancer", "Normal"...  Tow or even more phenotypes are allowed. (default = myLoad$pd$Sample_Group)}
  	\item{adjPVal}{The minimum threshold of significance for probes to be considered an DMP. (default = 0.05)}
	\item{adjust.method}{The p-value adjustment method to be used for the limma analyis, (default= BH (Benjamini-Hochberg))}
	\item{compare.group}{compare.group is a parameter to assign which two phenotypes you wish to analysis, if it's missed(NULL) or can not fulfill the condition of the dataset, the first two phenotypes in your pheno would be selected as compare.group automatically. (default = NULL)}
    \item{arraytype}{Choose microarray type is 450K or EPIC. (default = "450K")}
}
\value{
\item{PairedDMP}{A data frame of all probes with an adjusted p-value for significance of paired differential methylation containing columns for logFC, AveExpr, t, P.Value, adj.P.Val, B, Ave_Sub (Average value of subtraction betwen each pair of data), CHR, MAPINFO, Strand, Type, gene, feature, cgi, feat.cgi, UCSC_CpG_Islands_Name, DHS, Enhancer, Phantom, Probe_SNPs, Probe_SNPs_10}
}


\note{
    The internal structure of the result of champ.PairedDMP() function should not be modified if it's not necessary caused it would be assigned as inpute for some other functions like PairedDMP.GUI(), or champ.GSEA().
    You can try to use PairedDMP.GUI() to do interactively analysis on the result of champ.PairedDMP().
}

\references{
    Ritchie, ME, Phipson, B, Wu, D, Hu, Y, Law, CW, Shi, W, and Smyth, GK (2015). limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Research 43(7), e47

    Phipson, B, Lee, S, Majewski, IJ, Alexander, WS, and Smyth, GK (2016). Robust hyperparameter estimation protects against hypervariable genes and improves power to detect differential expression. Annals of Applied Statistics 10(2), 946-963.

}

\author{
Yuan Tian
}
\keyword{ limma }
