#!/usr/bin/env bash
set -euo pipefail

export TRG=en SRC=de GPU="0"

$MARIAN/marian \
     -c transformer-model.yml \
     -d ${GPU} --workspace 9000 --seed 1111 --after 10e \
     --model model/model.npz    --train-sets data/corpus.clean.{$SRC,$TRG} \
     --vocabs model/vocab.$SRC$TRG.spm model/vocab.$SRC$TRG.spm --dim-vocabs 32000 32000 \
     --valid-sets data/valid.{$SRC,$TRG}
     --log model/train.log --valid-log model/valid.log
