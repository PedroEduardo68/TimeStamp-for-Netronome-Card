#!/bin/bash

while [ 1000000000000000000000 ]; do
ntpd -q -g
sleep 300
nfp-reg xpb:Nbi0IsldXpbMap.NbiTopXpbMap.MacGlbAdrMap.MacCsr.MacTimeStampSetSec.MacTimeStampSetSec=$(printf "0x%x" $(date +%s))
nfp-reg xpb:Nbi0IsldXpbMap.NbiTopXpbMap.MacGlbAdrMap.MacCsr.MacTimeStampSetNSec.MacTimeStampSetNsec=$(printf "0x%x" $(date +%N))
nfp-reg xpb:Nbi0IsldXpbMap.NbiTopXpbMap.MacGlbAdrMap.MacCsr.MacSysSupCtrl.TimeStampEn=0
nfp-reg xpb:Nbi0IsldXpbMap.NbiTopXpbMap.MacGlbAdrMap.MacCsr.MacSysSupCtrl.TimeStampSet=1
nfp-xpb 0x8045000 0x90 
nfp-xpb 0x8045000 0x91 
nfp-reg xpb:Nbi0IsldXpbMap.NbiTopXpbMap.MacGlbAdrMap.MacCsr.MacSysSupCtrl.TimeStampEn=1
nfp-reg xpb:Nbi0IsldXpbMap.NbiTopXpbMap.MacGlbAdrMap.MacCsr.MacSysSupCtrl.TimeStampSet=0
sleep 1800
done
