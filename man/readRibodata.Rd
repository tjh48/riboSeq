\name{readRibodata}
\alias{readRibodata}
\title{
  Reads ribosomal and (optionally) rna data from alignment files.
}
\description{
  Reads BAM files, or flat text files (which may be compressed)
  containing strand, transcript name, start and sequence information for
  each alignment.
}
\usage{
readRibodata(riboFiles, rnaFiles, columns = c(strand = 1, seqname = 2,
start = 3, sequence = 4), zeroIndexed = FALSE, header = FALSE, replicates, seqnames)
}
\arguments{
  \item{riboFiles}{
    Filenames of ribosomal alignments.
}
  \item{rnaFiles}{
    Filenames of RNA alignments.
}
  \item{columns}{
    Columns of alignment files containing strand, transcript (seqname)
    name, start of alignment, and sequence. Ignored for BAM files.
  }
  \item{zeroIndexed}{
    Are the alignments zero-indexed (i.e., the first base in a sequence
    is 0). Defaults to FALSE.}
  \item{header}{
    Does the (non-bam) alignment file have a header line? Defaults to FALSE.
}
  \item{replicates}{
    Replicate information for the files.
}
  \item{seqnames}{
    Transcript (seqname) names to be read into the object. 
}
}
\details{
If a filename ends in '.bam' or '.BAM' it will be assumed that the file is
a BAM file and processed accordingly. Otherwise, it will be treated as a
flat text file.

If using text files these should contain (as a minimum), the sequence of the read, the name of the sequence to which the read aligns, the strand to which it aligns, and the starting position of alignment. A Bowtie alignment (note that Bowtie, rather than Bowtie2, is recommended for short reads, which ribosome footprints are) using the option ``--suppress 1,6,7,8'' will generate this minimal data. It is by default assumed that the data are generated in this way, and the default columns specification for the default readRibodata function (see below) reflects this.
}
\value{
\code{riboData} object.
}
\author{
Thomas J. Hardcastle
}

\examples{
datadir <- system.file("extdata", package = "riboSeqR")
ribofiles <- paste(datadir, 
                   "/chlamy236_plus_deNovo_plusOnly_Index", c(17,3,5,7), sep = "")
rnafiles <- paste(datadir, 
                  "/chlamy236_plus_deNovo_plusOnly_Index", c(10,12,14,16), sep = "")

riboDat <- readRibodata(ribofiles, rnafiles, replicates = c("WT", "WT", "M", "M"))
}
\keyword{IO}
\keyword{manip }
