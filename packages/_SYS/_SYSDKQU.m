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

;%SYSDKQU^INT^1^59547,73892^0
ZNETDIR ;
 K ^TAB($J) F %U=0:1 S LTAB=$P($T(TAB+%U),";;",2) Q:LTAB=""  F %V=1:1 S GLO=$P(LTAB,",",%V) Q:GLO=""  S ^TAB($J,GLO)=1
 D ^%GLO S GLO=0 F %U=1:1 S GLO=$O(^UTILITY("GLO",GLO)) Q:GLO=""  K:'($D(^TAB($J,GLO))) @("^"_GLO) W "."
FIN D INIT^UTFBSET,%ZPROTECT K ^TAB($J),%U,LTAB,%V,GLO Q
TAB ;;SIN,COS,ARCSIN,ARCOS,TANG,COTG,ARCTG,ARCCTG,PRECSTCT,ROUTINE,TOLISGLO,NAMEFUL,MN,SCRE,TABIDENT,SCRC,STRUCT,PRONUM,OCGRIL,GRUPLET,REFABAC,INTERGRI,OCUNIT,EVALGRIL
 ;;PARAGRIL,RESUGRIL,GRILRESU,GRTYPN,ABDEJEV,GROUGRIL,DEFGROUP,SSGRGRI,TIMCPGR,GRILEROR,SSGROUP,CPTEUR,UTILITY,TAB,TOZE,ENVIRON,ENVPAP,ENVCONF
 ;;AFORMULE,AIMPLICI,AIMPMAC,AIMPMAT,AMATIERE,ANOMENC,ASELMAT,BLOCIMPL,BLOCOPER,BLOCPHAS,CCOMPARA,CFORMULE,CIMPLICI,CIMPMAC,CIMPMAT,CMACSEL,CMATIERE,CNOMENC,COUTCONS,CPHASE,CSELMAT,DEFGROUP
 ;;EVALGRIL,AMACSEL,CMACSEL,EXPL,FFORMULE,FIMPLICI,FIMPMAT,FIMPMAC
 ;;FOUTCONS,AOUTCONS,FPHASE,FSELMAT,FULL,GRISELEC,GROUGRIL,GRUPLET,IMPBIS,INTERGRI,KEMPLOI,LIBCYCLE,CYCLE,AMBICYCL,AMBI,UNKN,NOMARL,NOMSRL,PARAGRIL,PARINDEF,REFABAC,REFLATER,RESUGRIL,TIMCOMP,TIMCPGR,TRI,UNITE,VEXTRANS,DEPARG,REPFICH,TYPLIB
 ;;UNITECR,GLOETUD,GRILRESU,ADIMOUT,CDIMOUT,FDIMOUT,SSGROUP,GRTYPN,SSGRGRI,UNITEXP,SENSFICH,IREPFICH,REPFICH
 ;;QUERY1,QUERY2,TBLPRON,TBLSTRUC,TBLOCGRI,TBLSCRC,TBLADEM,TBLPARU,TBLRELAT,TBLEV,TBLCOMP,TBLTRIN,TBLCYCL,TBLTREE,TBLIBCY,TBLREFCA,TBLCOREF,RQSREQ,RQSTAT,RQSPOOL,RQSPAR
 ;;CLICHE,CLIENCGD,CODNORM,COMMEXI,DENDIMO,DENOPER,MACHPAUT,P0GETARC,PARCLICH,PAUSICGD,PSRLFILI,PSRLPARF,PSRLRTES,TOP0ALGE,TRANSCRT,USINECGD
 ;;NAMEFUL,IMPLICIT,ACOMMEB,COMPARAT,CONSTANT,CPTEUR,DESMACH,ESSABAC,EXPGIMP,EXPLICIT,FORMULE,GAMLAF,IMPMAC,IMPMACH,IMPMAT,IMPTRIP,MACSEL,MATIERE,MATSTOCK,MN,NOMENC,PROBTEST,RESTEST,OUTCONS,PEXPMACH,PHASE,PRONUM,SAISIGAM,SCRC,SECTION
 ;;SELMAT,STRUCT,TOLEX,TOLEXK,TOLEXS,TOLISGLO,TOSYNONY,VALITOLE,CONVUNIT,DIMOUT,GRDEFOBJ,GRAPHE,GRINFO,SYNTETUD,GRDERCOR,IGNORER,USINECGD,CLIENCGD,CODNORM,TOP0ALGE,TRANSCRT,DENOPER,TOP0ALGE,DENDIMO,SYNTETUD,MACHPAUT,MAXMAT
 ;;FLABAC,FLCONS,FLFORM,FLIMPLI,FLMAT,FLNOM,FLPHAS,FLSELC,FLSELM,FLTRIP,FLDIM,FLMAC,OCGRIL,OCUNIT

