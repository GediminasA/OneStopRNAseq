library("DESeq2")
library("QoRTs")
#Read in the QC data:
print(getwd())
library("argparse")
parser <- ArgumentParser(description='Process some integers')
parser$add_argument("-d", "--decoder", type="character",help="decoder file")
parser$add_argument("-q", "--qorts", type="character",help="Qorts outputs file")
parser$add_argument("-o", "--out", type="character",help="Output dir")
args <- parser$parse_args()
print(paste("Decoder",args$decoder))
print(paste("QoRTS: ",args$qorts))
print(paste("OutDir: ",args$out))

res <- read.qc.results.data(args$qorts,
                        decoder.files = args$decoder ,
                        calc.DESeq2 = TRUE, calc.edgeR = FALSE);
out <- args$out

if (!dir.exists(out))
{
  dir.create(out, recursive = TRUE)
}

makeMultiPlot.all(res,
                  outfile.dir = out,
                  plot.device.name = "pdf");
