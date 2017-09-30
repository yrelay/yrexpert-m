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
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TONRPGO5^INT^1^59547,74873^0
ZGOQTOT ;
 
 W !,"Global output d'un savoir-faire TOTEM "
 W !,?10,"1                   SF saisie sans contenu des abaques"
 W !,?10,"2        1+         tables full match"
 W !,?10,"3        2+         contenu des abaques"
 W !,?10,"4        3+         comprehension du savoir-faire"
 W !,?10,"5        4+         Archivage des etudes anterieures"
 W !,!,?10,"Votre choix : " R OPT Q:(OPT<1)!(OPT>5)
 
 W !,!,!,"Description succincte de ce savoir-faire : " R COMMENT W !
 D ^%SETF,GSET I '(%G) C IO Q
 S NBGTOT=%G D ^%GOQMOD W !,!,%G," globals sauvegardes sur ",NBGTOT K NBGTOT Q
GSET S %JO=$J#256,%G=0 K ^UTILITY(%JO)
 S LOPT=OPT+1 F Z=1:1 S TAB=$T(1+Z) Q:TAB=""  I TAB'["      ; " S NOPT=$P(TAB,";;",1),LIG=$P(TAB,";;",2) Q:NOPT[LOPT  F W=1:1 S GLO=$P(LIG,",",W) Q:GLO=""  S ^UTILITY(%JO,GLO)=1,%G=%G+1
 Q
TABLETOT ;; TABLES TOTEM
1 
 ;;NAMEFUL,IMPLICI,ACOMMEB,COMPARAT,CONSTANT,CPTEUR,DESMACH,ESSABAC,EXPGIMP,EXPLICI,FORMULE,GAMLAF,IMPMAC,IMPMACH,IMPMAT,IMPTRIP,MACSEL,MATIERE,MATSTOCK,MN,NOMENC,PROBTEST,RESTEST,OUTCONS,PEXPMACH,PHASE,PRONUM,SAISIGAM,SCRC,SECTION
 ;;SELMAT,STRUCT,TOLEX,TOLEXK,TOLEXS,TOLISGLO,TOSYNONY,VALITOLE,CONVUNIT,DIMOUT,GRDEFOBJ,GRAPHE,GRINFO,SYNTETUD,GRDERCOR,IGNORER,USINECGD,CLIENCGD,CODNORM,TRANSCRT,DENOPER,TOP0ALGE,DENDIMO,MACHPAUT
2 
 ;;FLABAC,FLCONS,FLFORM,FLIMPLI,FLMAT,FLNOM,FLPHAS,FLSELC,FLSELM,FLTRIP,FLDIM,FLMAC
3 
 ;;OCGRIL,OCUNIT
4 
 ;;AFORMULE,AIMPLICI,AIMPMAC,AIMPMAT,AMATIERE,ANOMENC,ASELMAT,BLOCOPER,BLOCPHAS,CCOMPARA,CFORMULE,CIMPLICI,CIMPMAC,CIMPMAT,CMATIERE,CNOMENC,COUTCONS,CPHASE,CSELMAT,DEFGROUP,EVALGRIL,AMACSEL,CMACSEL,EXPL,FFORMULE,FIMPLICI,FIMPMAT,FIMPMAC
 ;;FOUTCONS,AOUTCONS,FPHASE,FSELMAT,FULL,GRISELEC,GROUGRIL,GRUPLET,IMPBIS,INTERGRI,KEMPLOI,LIBCYCLE,CYCLE,AMBICYCL,AMBI,UNKN,NOMARL,NOMSRL,PARAGRIL,PARINDEF,REFABAC,REFLATER,RESUGRIL,TIMCOMP,TIMCPGR,TRI,UNITE,VEXTRANS,DEPARG,REPFICH,TYPLIB
 ;;UNITECR,GLOETUD,GRILRESU,ADIMOUT,CDIMOUT,FDIMOUT,SSGROUP,GRTYPN,SSGRGRI,UNITEXP
5 
 ;;ANTETUDE,SECT,DIM,CONS,COUT,DUREE,PAREFLAT,PARMAT,PARMAC,PHAS,RAISON,REFANTET,TVPAR,TREEWORK,RAISMAT

