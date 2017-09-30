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

;%QSREASF^INT^1^59547,73883^0
QSREASF ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MENU N MENU,ADRES,CONTR,MENTRT,MENREQ,CONF
 N MENTOV,MENTOU,MENHEV,MENVAR,MENSCO,VALANSA
 S MENU="21^10^79"
 S MENU(1)=$$^%QZCHW("Traitements")_"^TRAIT"
 S MENU(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de tous les traitements, modeles et formats")
 S MENU(2)=$$^%QZCHW("Requetes")_"^REQUE"
 S MENU(2,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les requetes")
 S MENU(3)=$$^%QZCHW("HEVEA")_"^HEVEA"
 S MENU(3,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les conditions de transitions")
 S MENU(4)=$$^%QZCHW("Variables.Actives")_"^VARACT"
 S MENU(4,"COM")=$$^%QZCHW("Reanalyse des situations et des actions")
 S MENU(5)=$$^%QZCHW("Savoir.Comparer")_"^SCO"
 S MENU(5,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les regles")
 S MENU(6)=$$^%QZCHW("Tout")_"^TOUT"
 S MENU(6,"COM")=$$^%QZCHW("Regroupement de toutes les options precedentes")
MENUB D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse syntaxique du SF"),0)
ACTS S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENU",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G ACTS
 D:ADRES'="" @ADRES
 G MENUB
 
 
TRAIT G:$D(MENTRT) TRAITMN
 S MENTRT="21^10^79"
 S MENTRT(1)=$$^%QZCHW("Reanalyse")_"^TRAITR"
 S MENTRT(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de tous les traitements,modeles et formats")
 S MENTRT(2)=$$^%QZCHW("Resultats")_"^TRAITV"
 S MENTRT(2,"COM")=$$^%QZCHW("Resultats de la reanalyse")
TRAITMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse syntaxique des traitements"),0)
TRAITA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENTRT",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G TRAITA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G TRAITMN
 
TRAITR D TRAIT^%TLALLAN,INT^%EDFALLA,INT^%EDMALLA
 G TRAITMN
 
TRAITV D VISU^%TLALLAN,VISU^%EDFALLA,VISU^%EDMALLA
 G TRAITMN
 
 
REQUE G:$D(MENREQ) REQUEMN
 S MENREQ="21^10^79"
 S MENREQ(1)=$$^%QZCHW("Reanalyse")_"^REQUER"
 S MENREQ(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les requetes")
 S MENREQ(2)=$$^%QZCHW("Resultats")_"^REQUEV"
 S MENREQ(2,"COM")=$$^%QZCHW("Resultats de la reanalyse")
REQUEMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse syntaxique des requetes"),0)
REQUEA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENREQ",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G REQUEA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G REQUEMN
 
REQUER D REQU^%QSALLAN
 G REQUEMN
 
REQUEV D VISU^%QSALLAN
 G REQUEMN
 
 
HEVEA G:$D(MENHEV) HEVEAMN
 S MENHEV="21^10^79"
 S MENHEV(1)=$$^%QZCHW("Reanalyse")_"^HEVEAR"
 S MENHEV(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les conditions de transition")
 S MENHEV(2)=$$^%QZCHW("Resultats")_"^HEVEAV"
 S MENHEV(2,"COM")=$$^%QZCHW("Resultats de la reanalyse")
HEVEAMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse syntaxique des conditions"),0)
HEVEAA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENHEV",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G HEVEAA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G HEVEAMN
 
HEVEAR D ALL^%QMEAANA
 G HEVEAMN
 
HEVEAV D VISU^%QMEAANA
 G HEVEAMN
 
 
VARACT G:$D(MENVAR) VARACMN
 S MENVAR="21^10^79"
 S MENVAR(1)=$$^%QZCHW("Reanalyse")_"^VARACR"
 S MENVAR(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les variables actives")
 S MENVAR(2)=$$^%QZCHW("Resultats")_"^VARACV"
 S MENVAR(2,"COM")=$$^%QZCHW("Resultats de la reanalyse")
VARACMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse des variables actives"),0)
VARACA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENVAR",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G VARACA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G VARACMN
 
VARACR D ALL^%QSVAREA
 G VARACMN
 
VARACV D VISU^%QSVAREA
 G VARACMN
 
 
SCO G:$D(MENSCO) SCOMPMN
 S MENSCO="21^10^79"
 S MENSCO(1)=$$^%QZCHW("Reanalyse")_"^%SCOMPR"
 S MENSCO(1,"COM")=$$^%QZCHW("Reanalyse syntaxique de toutes les regles de Savoir Comparer")
 S MENSCO(2)=$$^%QZCHW("Resultats")_"^%SCOMPV"
 S MENSCO(2,"COM")=$$^%QZCHW("Resultats de la reanalyse")
SCOMPMN D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse des regles de Savoir Comparer"),0)
SCOMPA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENSCO",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G SCOMPA
 D CLEPAG^%VVIDEO
 G:ADRES'="" @ADRES
 G SCOMPMN
 
 ;HL2 SCOMPR D ALL^%SCOREAN
%SCOMPR D ALL^%SCOREAN
 G SCOMPMN
 
 ;HL2 SCOMPV D VISU^%SCOREAN
%SCOMPV D VISU^%SCOREAN
 G SCOMPMN
 
 
TOUT G TOUT^%QSREAS2

