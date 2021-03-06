\name{champ.SVD}
\alias{champ.SVD}

\title{
Singular Value Decomposition analysis for batch effects prediciton in HumanMethylation450 or HumanMethylationEPIC data
}

\description{
    Runs Singular Value Decomposition on a dataset to estimate the impact of batch effects. This function would run SVD deconvolution on beta matrix, get components explain most variance in original data set. Then use Random Matrix Theory to estimate numbers of latent variables. Then each significant components would be correlated with each phenotype, to see if this phenotype show significant correlation with this component. All suitable factors in your pd(Sample_Sheet.csv) file will be analysed. After champ.SVD(), used would get a heatmap indicating effect of factors on original data set. And decide if some batch effect shall be corrected before future analysis. Not all factors in your pd file woule be analysis though, name information like Sample_Name, Pool_ID... would be discarded, covariates contain less then 2 variances shall be discarded as well. Note that numeric covariates like age would be calculated with linear regression, while factors and character covariates like Sample_Group would be calculated with Krustal Test. Thus please check your input pd file carefully as well.
}

\usage{
    champ.SVD(beta = myNorm,
              rgSet=myLoad$rgSet,
              pd=myLoad$pd,
              RGEffect=FALSE,
              PDFplot=TRUE,
              Rplot=TRUE,
              resultsDir="./CHAMP_SVDimages/")
}

\arguments{
	\item{beta}{beta matrix waiting to be analysed, better to be one get Probe-Type normalized and imputed. (default = myNorm)}
	\item{rgSet}{An rgSet object that was created when data was loaded the data from the .idat files, which contains green and red color information of original data set, might be used if RGEffect set TRUE. (default = myLoad$rgSet)}
	\item{pd}{This data.frame includes the information from the sample sheet. (default = myLoad$pd)}
	\item{RGEffect}{If Green and Red color control probes would be calculated. (default = FALSE)}
    \item{PDFplot}{If PDFplot would be generated and save in resultsDir. (default = TRUE)}
    \item{Rplot}{If Rplot would be generated and save in resultsDir. Note if you are doing analysis on a server remotely, please make sure the server could connect your local graph applications. (For example X11 for linux.) (default = TRUE)}
    \item{resultsDir}{The directory where PDF files would be saved. (default = "./CHAMP_SVDimages/")}
}

\examples{
    \dontrun{
        myLoad <- champ.load(directory=system.file("extdata",package="ChAMPdata"))
        myNorm <- champ.norm()
        champ.SVD()
        }
}


\references{
    Teschendorff, A. E., Menon, U., Gentry-Maharaj, A., Ramus, S. J., Gayther, S. A., Apostolidou, S., Jones, A., Lechner, M., Beck, S., Jacobs, I. J., and Widschwendter, M. (2009). An epigenetic signature in peripheral blood predicts active ovarian cancer. PLoS One, 4(12), e8274
}
\author{
    Teschendorff, A \cr
    adapted by Yuan Tian
}

\keyword{ batch effects }
