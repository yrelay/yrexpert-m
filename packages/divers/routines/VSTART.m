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
;! Nomprog     : VSTART                                                       !
;! Module      : VIDEO                                                        !
;! But         : Lancement de YXP page bienvenue                              !
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
;! HL002 ! HL     ! 19/08/09 ! Mise en page texte de fin / reste PB accents   !
;! HL003 ! HL     ! 10/06/12 ! Déplacement de /usr/local/ vers /opt/          !
;! HL004 ! HL     ! 15/08/12 ! La base YXP devient YEXPERT                    !
;! HL005 ! HL     ! 11/11/15 ! Démarrer avec la partition "YXP"               !
;! HL006 ! HL     ! 03/07/18 ! %Y* reservé SYS - remplacer %YEXPERT/YREXPERT  !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!



VSTART ;
 
 N ORDI,VERSI,BIDON

 Q:'$$ZPROMPT^%GTM()
 ;HL005 D NSP^%DIR
 ;HL004 I %NSP'="YXP" W #,!!,%NSP," : inconnu...",!,"CONSEIL : Modifier les fichiers ~/.profile et/ou /opt/yxpstart et/ou GTMINI.m,",!,"          la partition courant doit etre : YXP",!! G FIN
 Q:'$$ZGBLDIR^%GTM("YXP") ;HL0005
 
 S hh=$P($ZD($H,"24:60:SS"),":",1)
 S mm=$P($ZD($H,"24:60:SS"),":",2)
 S ss=$P($ZD($H,"24:60:SS"),":",3)
 S ^YREXPERT($I,"DATE","DEB")=$ZD($H,"DD/MM/YEAR")
 S ^YREXPERT($I,"TIME","DEB")=$ZD($H,"24:60:SS")
 S ^YREXPERT($I,"CHRONO","DEB")=($P($H,",")*86400)+((((hh*60)+mm)*60)+ss)
 S:'$D(^YREXPERT($I,"CONNECTION","NB")) ^YREXPERT($I,"CONNECTION","NB")=0 S ^YREXPERT($I,"CONNECTION","NB")=^YREXPERT($I,"CONNECTION","NB")+1
 S:'$D(^YREXPERT("*","CONNECTION","NB")) ^YREXPERT("*","CONNECTION","NB")=0 S ^YREXPERT("*","CONNECTION","NB")=^YREXPERT("*","CONNECTION","NB")+1
 
 S ^%PK($I)="VT220"
 D INIT^%SGVAR
 D INIT20^%ZGEPC,INIT21^%ZGEPC
 K ^SEMAPHO
 
 D CURRENT^%IS,VARSYS^%QCSAP
 D CLEPAG^%VVIDEO
 D NORM^%VVIDEO
 S DX=10,DY=6 X XY
 S ORDI=$$PCONF^%INCASTO("NOMHOST")
 I ORDI'="" D REV^%VVIDEO W "BIENVENUE SUR "_ORDI
 I $D(^INCONNE("VERSION")) W " - YEXPERT ("_^INCONNE("VERSION")_")"
 ;W " en bêta-test !"
 D NORM^%VVIDEO
 W !!!!,"Tapez [RETURN], puis <votre partition> et votre <mot de passe>",!
 W !!,"N.B. Si vous voulez entrer dans le menu Général d'Yexpert (version Demo) :"
 W !,"     votre partition : DMO"
 W !,"        mot de passe : DMO"
 D POCLEPA^%VVIDEO
 ;W "Copyright (C) 2001-2015 by (HL)."
 ;W $$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")"
 S DX=0,DY=16 X XY
 R *X:180
 D ^%VACT
 
 S hh=$P($ZD($H,"24:60:SS"),":",1)
 S mm=$P($ZD($H,"24:60:SS"),":",2)
 S ss=$P($ZD($H,"24:60:SS"),":",3)
 S chr=(($P($H,",")*86400)+(((((hh*60)+mm)*60)+ss)))-^YREXPERT($I,"CHRONO","DEB")
 
 
 D NORM^%VVIDEO,CLEPAG^%VVIDEO
 
 D CLEPAG^%VVIDEO
 W "!----------------------------------------------------------------------------!",!
 W "!                                                                            !",!
 W "! Licence et conditions d'utilisation                                        !",!
 W "! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !",!
 W "! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !",!
 W "!                                                                            !",!
 W "! Hamid LOUAKED                                                              !",!
 W "! 10, impasse Faraday                                                        !",!
 W "! 78520 LIMAY                                                                !",!
 W "! France                                                                     !",!
 W "!                                                                            !",!
 W "! yexpert@yrelay.com                                                         !",!
 W "! http://www.yrelay.fr/                                                     !",!
 W "!                                                                            !",!
 W "! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !",!
 W "! et/ou le modifier conformement aux dispositions de la Licence Publique     !",!
 W "! Generale GNU, telle que publiee par la Free Software Foundation ;          !",!
 W "! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.",!
 W "!                                                                            !",!
 W "! Ce programme est distribue dans l'espoir qu'il sera utile,                 !",!
 W "! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !",!
 W "! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !",!

 R "[RETURN]",*X:180
 D CLEPAG^%VVIDEO

 W "! Pour plus de details, voir la Licence Publique Generale GNU.               !",!
 W "!                                                                            !",!
 W "! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !",!
 W "! ce programme ; si ce n'est pas le cas,                                     !",!
 W "! ecrivez a la Free Software Foundation Inc.,                                !",!
 W "! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !",!
 W "!                                                                            !",!
 W "! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !",!
 W "! vous trouverez egalement, sur ce site, un mode d'emploi complet            !",!
 W "! et des informations supplementaires.                                       !",!
 W "!                                                                            !",!
 W "!----------------------------------------------------------------------------!",!
 W "!                                                                            !",!
 W "! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !",!
 W "!                                                                            !",!
 W "! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !",!
 W "!                                                                            !",!
 W "!----------------------------------------------------------------------------!",!

 R "[RETURN]",*X:180
 D CLEPAG^%VVIDEO

 W !
 W "Session : " W:$D(QUI) QUI
 W ?10,". Ouverte le ",^YREXPERT($I,"DATE","DEB")," à ",^YREXPERT($I,"TIME","DEB"),!
 W ?10,". Fermée le ",$ZD($H,"DD/MM/YEAR")," à ",$ZD($H,"24:60:SS"),!
 W ?10,". Durée d'utilisation ",chr\86400," jour(s) ",$ZD("0,"_chr,"24:60:SS"),!
 W ?10,". Nombre de connections pour ",$I," : ",^YREXPERT($I,"CONNECTION","NB"),!
 W ?10,". Nombre de connections pour ","*"," : ",^YREXPERT("*","CONNECTION","NB"),!
 W ?60,"au revoir...",!
 
 R "[RETURN]",*X:180
 D CLEPAG^%VVIDEO
 
FIN D KILL^%SGVAR
 K ^%PK($I)
 
 Q

