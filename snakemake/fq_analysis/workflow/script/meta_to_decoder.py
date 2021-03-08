import pandas as pd
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", default="meta/meta.xlsx",
                  action="store",
                  help="Meta data xlsx file")
parser.add_argument("-o", "--output",
                  action="store",
                  default="meta/decoder.txt",
                   help="Meta data txt file")
args = parser.parse_args()
df=pd.read_excel(args.input,  engine='openpyxl')
print(df)
df.columns = ["sample.ID", "group.ID", "batch.ID"]
df.to_csv(args.output, sep="\t", index=False)
