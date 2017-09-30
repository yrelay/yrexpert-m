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

;TONETTOIE^INT^1^59547,74873^0
TONETTOIE ;
 ;; les infos sauf le savoir faire propre ..
 ;;toutes less dd supprimees sont regenerables
 
 W !,"reduction au minimum d'une partition de savoir-faire TOTEM "
 
 W !,?10,"2                  tables full match"
 W !,?10,"4                  comprehension du savoir-faire"
 W !,?10,"5                 Archivage des etudes anterieures"
 ;;;;  ici confirmation de suppression
 ;;
 D KILL
 Q
KILL ;;
 F L=1:1 S TAB=$T(2+L) Q:TAB=""  S NOPT=$P(TAB,";;",1),LIG=$P(TAB,";;",2) F W=1:1 S GLO=$P(LIG,",",W) Q:GLO=""  W !," killing  ",GLO S g1="^[QUI]"_GLO K @(g1)
 Q
2 ;;
 ;;FLABAC,FLCONS,FLFORM,FLIMPLI,FLMAT,FLNOM,FLPHAS,FLSELC,FLSELM,FLTRIP,FLDIM,FLMAC
4 
 ;;AFORMULE,AIMPLICI,AIMPMAC,AIMPMAT,AMATIERE,ANOMENC,ASELMAT,BLOCOPER,BLOCPHAS,CCOMPARA,CFORMULE,CIMPLICI,CIMPMAC,CIMPMAT,CMACSEL,CMATIERE,CNOMENC,COUTCONS,CPHASE,CSELMAT,DEFGROUP,EVALGRIL,AMACSEL,CMACSEL,EXPL,FFORMULE,FIMPLICI,FIMPMAT,FIMPMAC,APHASE
 ;;FOUTCONS,AOUTCONS,FPHASE,FSELMAT,FULL,GRISELEC,GROUGRIL,GRUPLET,IMPBIS,INTERGRI,KEMPLOI,LIBCYCLE,CYCLE,AMBICYCL,AMBI,UNKN,NOMARL,NOMSRL,PARAGRIL,PARINDEF,REFABAC,REFLATER,RESUGRIL,TIMCOMP,TIMCPGR,TRI,UNITE,VEXTRANS,DEPARG,REPFICH,TYPLIB
 ;;UNITECR,GLOETUD,GRILRESU,ADIMOUT,CDIMOUT,FDIMOUT,SSGROUP,GRTYPN,SSGRGRI,UNITEXP,SENSFICH,IREPFICH,REPFICH
5 
 ;;ANTETUDE,SECT,DIM,RESTEST,CONS,COUT,DUREE,PAREFLAT,PARMAT,PARMAC,PHAS,RAISON,REFANTET,TVPAR,TREEWORK,RAISMAT,EVBACK,TOIVDEF,TOIVTRI,ORDEVAL,CARATPC,RESBATCH,RANG,TRINIT,DELIMP,BLOCIMPL,PROBTEST,NONTRI

