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

;%QSREAS2^INT^1^59547,73883^0
QSREAS2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TOUT G:$D(MENTOU) TOUTMN
 S MENTOU="21^10^79"
 S MENTOU(1)=$$^%QZCHW("Reanalyse")_"^TOUTR"
 S MENTOU(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de tout le SF")
 S MENTOU(2)=$$^%QZCHW("Resultats")_"^TOUTV"
 S MENTOU(2,"COM")=$$^%QZCHW("Resultats de la reanalyse")
TOUTMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse syntaxique des conditions"),0)
TOUTA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENTOU",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G TOUTA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G TOUTMN
 
TOUTR D POCLEPA^%VVIDEO
 G:'($$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la reanalyse de tout le SF ?"))) TOUTA
 I '($D(^[QUI]RQSGLO("ANSA"))) S VALANSA=$ZP(^[QUI]ANSA("")),^[QUI]RQSGLO("ANSA")=$S(VALANSA="":0,VALANSA="z":0,1:VALANSA)
 D REINIT^%QCAGLK("^[QUI]ANSA")
 D ANNONCE("TRAITEMENTS")
 D TRAIT^%TLALLAN
 D ANNONCE("MODELES")
 D INT^%EDMALLA
 D ANNONCE("FORMATS")
 D INT^%EDFALLA
 D ANNONCE("REQUETES")
 D REQU^%QSALLAN
 D ANNONCE("CONDITIONS DE TRANSITIONS")
 D ALL^%QMEAANA
 D ANNONCE("VARIABLES ACTIVES")
 D ALL^%QSVAREA
 D ANNONCE("REGLES DE SAVOIR COMPARER")
 D ALL^%SCOREAN
 G TOUTMN
 
TOUTV G:$D(MENTOV) TOUVMN
 S MENTOV="21^10^79"
 S MENTOV(1)=$$^%QZCHW("Traitements")_"^TOUVT"
 S MENTOV(1,"COM")=$$^%QZCHW("Resultats de la reanalyse des traitements,modeles et formats")
 S MENTOV(2)=$$^%QZCHW("Requetes")_"^TOUVR"
 S MENTOV(2,"COM")=$$^%QZCHW("Resultats de la reanalyse des requetes")
 S MENTOV(3)=$$^%QZCHW("HEVEA")_"^TOUVH"
 S MENTOV(3,"COM")=$$^%QZCHW("Resultats de la reanalyse des conditions de transition")
 S MENTOV(4)=$$^%QZCHW("Variables.actives")_"^TOUVV"
 S MENTOV(4,"COM")=$$^%QZCHW("Resultats de la reanalyse des variables actives")
 S MENTOV(5)=$$^%QZCHW("Savoir.Comparer")_"^TOUVS"
 S MENTOV(5,"COM")=$$^%QZCHW("Resultats de la reanalyse des regles de Savoir Comparer")
TOUVMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Resultats de la reanalyse syntaxique"),0)
TOUVA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENTOV",.ADRES,.CONTR)
 G:(CONTR="A")!(CONTR="F") TOUTMN
 I CONTR'="" D ^%VSQUEAK G TOUVA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G TOUVMN
 
TOUVT D VISU^%TLALLAN,VISU^%EDMALLA,VISU^%EDFALLA
 G TOUVMN
 
TOUVR D VISU^%QSALLAN
 G TOUVMN
 
TOUVH D VISU^%QMEAANA
 G TOUVMN
 
TOUVV D VISU^%QSVAREA
 G TOUVMN
 
TOUVS D VISU^%SCOREAN
 G TOUVMN
 
ANNONCE(TITRE) 
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW(TITRE),0)
 S DX=0,DY=2 X XY
 Q
 ;
 ;
 ;
 ;

