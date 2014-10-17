#!/bin/bash
TEXMFHOME=`kpsewhich -var-value TEXMFHOME`
cp -vru bibtex $TEXMFHOME
cp -vru tex    $TEXMFHOME
