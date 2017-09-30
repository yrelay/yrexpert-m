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

;TOIVIII^INT^1^59547,74872^0
TOIVIII ;
 
 D WHOIS^TOWWHOIS
 K ^V($I),^BUT3($J),^PSRL($J),^PHASE($I),^BLOCPHAS($I),^PARINDEF($I),^GLOETUPH($I),^TPBLIMP($I),^PILETUD($I),^POSICOMP($I),^PHASADM($I),^GLOETUD($I),^NBRGLEV($I),^TENTATIV($I),^AIGNOR($I) S BATCH=0
 I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC Q
 
BEG K ^PILETUD($I),^IGNOR($I),^BLOCI($I),^INDEF($I),^BISIMP($I),^BLOC($I),^CPTBLOC($I),^CPTEUR($I),^ORDEVAL($I) S ^CPTPAR(1)="^[QUI]CPTEUR(NUFA,TWREF,""ART"")",^CPTBLOC($I)=1,^CPTBLOC($I,"BLOC")=0
 K ^EXIGRAPH($I),^VBIS($I),^VALGIV($I),^NEXSUN($I),NUDEC,TREETUD,NEXSUN,NSIM,TPRES,YBCOUR,LIPRES,COPRES,^TPRES($I),^TPRESV($I) S $ZT="" I '($D(^TOZE($I,"EXEC"))) S ^TOZE($I,"EXEC")=0
 D CURRENT^%IS,^TOTPOP K VAL,PAR,PARP,XART,QUANTI,TNOMEN,V
CADRE S %ABEND=0,NUFA=$$^%QZCHW(" ") D ^TOTCADRE,^TOWWHOIS
 D ^TOIVEXGE G:OUT FIN S %ART=$P(IDSTO,"/",1)_":"_$P(IDSTO,"/",2,999) K IDSTO D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=5,GRAPH=1,MSG=$$^%QZCHW("Acquisition des buts") D TO4^%VZCD,^TOIVGBUT G:'($D(^BUT($J))) FIN D ^TOIVEVAL
FIN Q

