#!/bin/bash

# $1 is input.pdf
# $2 is output.pdf

if [[ "$1" == "-h" ]]; then
  echo "Compress PDF files with Ghost Script!
gscompress <arg1> <arg2>
<arg1> = Input PDF name (eg = input.pdf)
<arg2> = Output PDF name (eg = output.pdf)

Compression Formats!
1:screen   = (72 dpi)
2:ebook    = (150 dpi)
3:prepress = (300 dpi)
4:printer  = (300 dpi)
0:default  = (Auto, output may be bigger!)
"
  exit
elif [[ -z "$1" ]]; then
  echo "Input PDF argument missing!
  Pass -h argument for help"
  exit
elif [[ -z "$2" ]]; then
  echo "Output PDF argument missing!
  Pass -h argument for help"
  exit
fi

read -p "Enter the compression format.
(1=screen) (2=ebook) (3=prepress) (4=printer) (0=default): " num

types=(
	"default"
	"screen"
	"ebook"
	"prepress"
	"printer"
)

if [[ "$num" =~ ^[0-4]$ ]]; then
 gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/${types[$num]} \
-dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2" "$1"
else 
echo "Enter a valid option!
Pass -h argument for help"
fi
