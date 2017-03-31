\name{champ.PairedDMR}
\alias{champ.PairedDMR}
\title{
    Applying Modified Bumphunter Algorithms to detect Paired Differential Methylation Regions in a beta valued Methylation Dataset.
}
\description{
    This function provided a modified Bumphunter Algorithm to detect paired Differential Methylation Regions in a beta valued Methylation Dataset. The original Bumphunter Algorithm is designed to calculated Differential Methylated Regions, which used t statistic to calculate regions, so here we replaced normal t statistic in Bumphunter algorithm as paired t statistic from Paired Test, the rest are remained the same. When using this function, user MUST provide pair information and pheno information, and make sure they are matched with each other correctly.
}

\usage{
champ.PairedDMR <- function(beta = myNorm,
                            pair = NULL,
                            pheno = myLoad$pd$Sample_Group,
                            cutoff=NULL,
                            pickCutoff=TRUE,
                            B=250,
                            cores = 3,
                            maxGap = 300,
                            minProbes = 7,
                            bpspan=1000,
                            adjPvalDmr=0.05,
                            arraytype = "450K")

}
\arguments{
    \item{beta}{A No-NA Normalised beta matrix (or DataFrame), both EPIC or 450K are acceptatable. (default = myNorm)}
    \item{pair}{A vector to indicate paired information for samples. (default = NULL)}
    \item{pheno}{A vector to indicate phenotype information for samples. (default = myLoad$pd$Sample_Group)}
    \item{cutoff}{Cutoff of t statistic used to select significant P value, if NULL, this function will automatically select 99\% value of all permutation as cutoff value. (default = NULL)}
    \item{pickCutoff}{Whether function should select cutoff automatically. (default = NULL)}
    \item{B}{ How many runs of Permutation should be applied. (default = 250)}
    \item{cores}{ How many cores would be used to do parallel running. (default = 3)}
    \item{maxGap}{The maxGap between two CpGs that will be considered into one cluster. (default = 300)}
    \item{minProbes}{min number of probes should be included by one cluster. (default = 7)}
    \item{bpspan}{ IMPORTANT PARAMETER, this parameter contols the smooth function effect. (default = 1000)}
    \item{adjPvalDmr}{ P value cutoff to select significant Paired DMRs after all calculation. (default = 0.05)}
    \item{arraytype}{If the data inputed a EPIC array or 450K array. (default = "450K")}
}

\value{
	\item{PairedDMR}{One DataFrame contains significant Paired DMRs calculated by this function, information contained in it is similar to original result of Bumphunter Algorithm, so you may check the references of Bumphunter to see more details. The result of champ.PairedDMR() is the input of PairedDMR.GUI() and champ.GSEA() function, so we suggest users not to change internal structure of PairedDMR's result.}
}

\note{
    The internal structure of the result of champ.PairedDMR() function should not be modified if it's not necessary caused it would be assigned as input for some other functions like champ.GSEA().
    You can try to use PairedDMR.GUI() to do interactively analysis on the result of champ.PairedDMR().
}

\references{
    Jaffe AE et a. Bump hunting to identify differentially methylated regions in epigenetic epidemiology studies. Int J Epidemiol. 2012;41(1):200-209.
}

\author{
    Yuan Tian
}
\keyword{ PairedDMR }
