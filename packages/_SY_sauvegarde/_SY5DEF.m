;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SY5DEF^INT^1^59547,73892^0
%SY5DEF ;;09:29 AM  8 Jun 1993; ; 08 Jun 93  9:38 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIST K GL
 F PR="TO","DK","DI" F I=1:1:3 F J=0:1:9 S A=PR_I_J I $T(@A+0)'="" F K=0:1 S CH=$P($T(@A+K),";;",2) Q:CH=""  F L=1:1 S X=$P(CH,",",L) Q:X=""  S GL(X)=I
 K GL("debut")
 Q
NETTOIE F PR="TO","DK","DI" F I=2:1:3 F J=0:1:9 S A=PR_I_J I $T(@A+0)'="" F K=0:1 S CH=$P($T(@A+K),";;",2) Q:CH=""  F L=1:1 S X=$P(CH,",",L) Q:X=""  S G="^[QUI]"_X K @(G)
 Q
 
UNKNOWN 
 S rco=$P($ZPOS,"^",2),dco=$P($ZPOS,"^",2)SPACE
 S sou=$ZRS(rco)
 D LIST
 ;HL002 ZN QUI
 S ZN=$$ZGBLDIR^%GTM(QUI)
 S a="A" F  S a="^"_a,a=$O(@a) Q:a=""  I '($D(GL(a))) S sou=sou_$C(9)_";;"_a_$C(10)
 ;HL002 ZN dco
 S ZN=$$ZGBLDIR^%GTM(dco)
 ZS @rco:sou:1
 Q
 
 
TO10 ;;AUTOPLAF,GAMLAF,OCGRIL,OCUNIT,PRONUM,SAISIGAM,SCRC,STRUCT
 
 
TO11 ;;ACOMMEB,CODNORM,COMPARAT,CONSTANT,CONVUNIT,COUCOMP,CTACHCPT,DENDIMO,DENOPER,DESMACH,DIMOUT,ESSABAC,EXPGIMP,EXPLICI,FORMULE,IGNORER,IMPLICI,IMPMAC,IMPMAT,IMPTRIP,INDEFIND,INDICE,MACHPAUT,AUTREFO
 ;;MACSEL,MATIERE,MATSTOCK,MAXMAT,NOMENC,OUTCONS,PEXPMACH,PHASE,PROBTEST,SECTION,SELMAT,SYNTETUD,TOCTREV,TOP0ALGE,TOP0CORR,TRANSCRT,TREEIMP,VALITOLE
 
 
 
TO20 ;;FLABAC,FLCONS,FLFORM,FLIMPLI,FLMAT,FLNOM,FLPHAS,FLSELC,FLSELM,FLTRIP,FLDIM,FLMAC,FLCOMP
 
 
 
TO21 ;;AFORMULE,AIMPLICI,AIMPMAC,AIMPMAT,AMATIERE,ANOMENC,ASELMAT,BLOCOPER,BLOCPHAS,CCOMPARA,CFORMULE,CIMPLICI,CIMPMAC,CIMPMAT,CMACSEL,CMATIERE,CNOMENC,COUTCONS,CPHASE,CSELMAT,AMACSEL,CMACSEL,EXPL,FFORMULE,FIMPLICI,FIMPMAT,FIMPMAC,APHASE
 ;;FOUTCONS,AOUTCONS,FPHASE,FSELMAT,FULL,GRUPLET,IMPBIS,INTERGRI,KEMPLOI,LIBCYCLE,CYCLE,AMBICYCL,AMBI,UNKN,NOMARL,NOMSRL,PARAGRIL,PARINDEF,REFABAC,REFLATER,RESUGRIL,TIMCOMP,TIMCPGR,TRI,UNITE,VEXTRANS,DEPARG,REPFICH,TYPLIB
 ;;UNITECR,GLOETUD,ADIMOUT,CDIMOUT,FDIMOUT,UNITEXP,SENSFICH,IREPFICH,REPFICH
 ;;ESTAPARU,RELATION,TBTSLIB
 
 
 
TO22 ;;DEFGROUP,EVALGRIL,GRILEROR,GRILRESU,GRISELEC,GROUGRIL,GRTYPN,INTERGRI,PARAGRIL,REFABAC,RESUGRIL,SSGRGRI,SSGROUP,TIMCPGR,TOCPBORN,TOCPNUPL,TOCPVCOL,TOCPVPAR
 
 
 
TO23 ;;ANTETUDE,SECT,DIM,RESTEST,CONS,COUT,DUREE,PAREFLAT,PARMAT,PARMAC,PHAS,RAISON,REFANTET,TVPAR,TREEWORK,RAISMAT,EVBACK,TOIVDEF,TOIVTRI,ORDEVAL,CARATPC,RESBATCH,RANG,TRINIT,DELIMP,BLOCIMPL,PROBTEST,NONTRI
 
 
 
TO24 ;;ABDEJEV
 
 
 
 
 
 
DK10 ;;EDMOD,EDFORMAT,SDOBJ,SDTEXT,SDCOL
 
DK11 ;;TTL,RQS1,QSVARACT
 
DK12 ;;RQSGLO,QUERY2,QUERYT
 
DK13 ;;LKYATR2,LKYENR2,LKY2
 ;;LKY
 ;;LKX
 
DK14 ;;RQSMOD,RQSMOD1,RQSMOD2,RQSMOD3,RQSMOD4,RQSMOD5,RQSMOD6,RQSMOD7,RQSMOD8,RQSMDL1,RQSMDL2,RQSMDL3,RQSMDL4
 
DK15 ;;TOLEX
 
DK16 ;;ZLIGCALC,ZLIGCOMP,ZLIGDUPL,ZLIGTOID,ZLILA,RQS2,ZLIGTRIE
 
DK17 ;;TLDIAL,TLDIALI,TLDIALF,QSETAT,QSETATP,QSETATS,RQSATPR
 
DK18 ;;MN
 
 
 
 
DK20 ;;QUERY1,QUERY3,QUERY4
 
 
DK21 ;;ANSA,RQSDON,PBMANF,PBMANM,PBMANA
 
DK22 ;;PLEX,PLEXP,PLEXI,TOLEXS,TOUNIT,TOSYNONY,TOLEXU
 
DK23 ;;RQSMODIN
 
DK24 ;;SDCOMP
 
DK25 ;;RQSAUTOR,RQSDEFAU,RQSFILS,RQSILIEN,RQSLIEN,RQSLIEN2,RQSNCLES,RQSNOINT,RQSNOLOG,RQSPERE,RQSQUAL
 
DK26 ;;ATRADUIR
 
 
 
DK30 ;;TOLEXC,MOZART,RQS3,QSLIENI,TEMPORAI,TOZE,TBTOZE
 ;;LK,LKYENRD,LKYATR
 
 
 
DI30 ;;TTL2,EDM,EDF,EJEV,BDEJEV,IMPLICIT,BIDON,EV,RQS11,QSET,QSETP,QSETS,AIMP,UTTTL,UTTTX,ETAT,PROGMOD
 
 
 
 
DI10 ;;ADLJ,DLFLUX,DLJ,CDLJ,APLJ,CPLJ,FLPLJ,PLCAHOJO,PLCAJOFE,PLCALEND,PLCAREGI,PLCAPEPA,PLCAPENO,PLFLUX,PLJ,PLJALDEF,PLJSF,PLPLACAL,PLPOINTS,PLPOSQUA
 
DI11 ;;DESMACHI,DESOUT,IMPLCOM
 
DI12 ;;EDVERSI,PILE
 
DI13 ;;QSVARAT,QSVARAT1
 
DI19 ;;debut
 ;;ALEXIQUE
 ;;BASP
 ;;CMOZREL
 ;;CPTEUR
 ;;GCURGRIL
 ;;GLDEF
 ;;GLO
 ;;GRAPHE2
 ;;HISTOGR
 ;;IGCURGRI
 ;;JACHTMP
 ;;LKYENR
 ;;LXRAP
 ;;MACAP
 ;;MACAPD
 ;;MACOP
 ;;MOZ
 ;;MOZGARDE
 ;;MOZITEM
 ;;MOZPARA
 ;;MOZREL
 ;;OABRES
 ;;PAR
 ;;PARP
 ;;PBMANT
 ;;PRESCR
 ;;PTPOSIT
 ;;PTVERSI
 ;;RAPLEXSF
 ;;RQS4
 ;;RQSDROIT
 ;;SCOMDOM
 ;;SCOMPREG
 ;;SDSYMBC
 ;;SDSYMBO
 ;;SDSYMBT
 ;;SOURJEUX
 ;;SOURKS
 ;;SRTOK
 ;;TOLEXNUS
 ;;TOLEXNUSE
 ;;TOLISRAM
 ;;TORQYC
 ;;ZLEXIQUE
 ;;ZLIGVALE
 ;;ZSYNINV
 ;;ZSYNONY
 ;;ZSYSMORE
 ;;GRC

